class Vehicle < ApplicationRecord
  belongs_to :user

  require 'ocr_space'

  def new
  end

  def open(url)
  Net::HTTP.get(URI.parse(url))
  end

  def self.get_data(current_user)
    @user = User.find_by_id(current_user.id)

    vehicles = Cloudinary::Search
    .expression("folder=#{current_user.id}")
    .execute

    array = @user.vehicles.select {|vehicle| vehicle["url"]}

      data = {}
      data_v = []
      data_ocr = []
      data_carnet = []
      (0...vehicles["resources"].length).each do |i|
       if array.include?(vehicles["resources"][i]["public_id"]) == false || array.empty?    #first block text extraction
        pic = vehicles["resources"][i]["url"]

        data_v << vehicles["resources"][i]

        image = URI("#{pic}")
        header2 = { 'apikey' => ENV["ocr"], 'Content-Type' => 'image/jpg' }

         body2 = { 'language' => 'eng', 'url' => image, 'iscreatesearchablepdf' => false, 'issearchablepdfhidetextlayer' => false, 'filetype' => 'jpg', 'OCREngine' => '2' }

        response2 =  HTTParty.post("http://apipro1.ocr.space/parse/image", headers: header2, body: body2)

        data_ocr << response2["ParsedResults"][0]["ParsedText"]

        headers = {
          'api-key' => ENV["carnet_key"],
          'Content-Type' => 'application/octet-stream'
        }

        body = open(pic) {|f| f.read }
        response = HTTParty.post("https://api.carnet.ai/v2/mmg/detect", headers: headers, body: body)
        response = response.body
        result = JSON.parse(response)
          if result["detections"].length > 0
            data_carnet << result["detections"][0]["mmg"]
          end

      data["vehicles"] = data_v
      data["ocr"] = data_ocr
      data["carnet"] = data_carnet
      end
    end
    data
  end

  def self.add(current_user)
      @info = Vehicle.get_data(current_user)

      (0...@info["vehicles"].length).each do |i|
        
        carnet = @info["carnet"][i][0]
        auto = @info["vehicles"][i]
        ocr = @info["ocr"][i]

          @new_vehicle = Vehicle.create(:make => carnet["make_name"], :model => carnet["model_name"], :year => carnet["years"], :plate => ocr, :color => "", :background => "", :user_id => current_user.id, :url => auto["url"], :public_id => auto["public_id"], :report_id => nil)
      end
        @new_vehicle.save
  end
 end
