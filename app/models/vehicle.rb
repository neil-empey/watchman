class Vehicle < ApplicationRecord
  belongs_to :user
  belongs_to :neighborhood



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

        picture = URI("#{pic}")
        header2 = { 'apikey' => ENV["ocr"], 'Content-Type' => 'image/jpg' }

         body2 = { 'language' => 'eng', 'url' => picture, 'iscreatesearchablepdf' => false, 'issearchablepdfhidetextlayer' => false, 'filetype' => 'jpg', 'OCREngine' => '2' }

        response2 =  HTTParty.post("http://apipro1.ocr.space/parse/image", headers: header2, body: body2)

        data_ocr << response2["ParsedResults"][0]["ParsedText"]

        headers = {
          "Content-Type": "application/json",
          "X-Access-Token": ENV["X-Access-Token"]
        }

        body = {"image": pic}.to_json

        response = HTTParty.post("https://dev.sighthoundapi.com//v1/recognition?objectType=vehicle,licenseplate", headers: headers, body: body)
        response = response.body

        data_carnet << JSON.parse(response)



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

        #plate number
        #data_carnet["objects"][0]["vehicleAnnotation"]["licenseplate"]["attributes"]["system"]["string"]["name"]

        #plate state
        #data_carnet["objects"][0]["vehicleAnnotation"]["licenseplate"]["attributes"]["system"]["region"]["name"]

        #make name
        #data_carnet["objects"][0]["vehicleAnnotation"]["attributes"]["system"]["make"]["name"]

        #model name
        #data_carnet["objects"][0]["vehicleAnnotation"]["attributes"]["system"]["model"]["name"]

        #color name
        #data_carnet["objects"][0]["vehicleAnnotation"]["attributes"]["system"]["color"]["name"]


        carnet = @info["carnet"][i]
        auto = @info["vehicles"][i]
        ocr = @info["ocr"][i]



        make_name = carnet["objects"][0]["vehicleAnnotation"]["attributes"]["system"]["make"]["name"]
        model_name = carnet["objects"][0]["vehicleAnnotation"]["attributes"]["system"]["model"]["name"]
        plate_num = carnet["objects"][0]["vehicleAnnotation"]["licenseplate"]["attributes"]["system"]["string"]["name"]
        color_name = carnet["objects"][0]["vehicleAnnotation"]["attributes"]["system"]["color"]["name"]
        plate_state = carnet["objects"][0]["vehicleAnnotation"]["licenseplate"]["attributes"]["system"]["region"]["name"]

          @user = current_user
          @hood = Neighborhood.find_by_id(@user.neighborhood_id)

          @new_vehicle = Vehicle.create(:make => make_name, :model => model_name, :year => "", :plate => plate_num, :color => color_name, :background => plate_state, :user_id => current_user.id, :url => auto["url"], :public_id => auto["public_id"], :neighborhood_id => current_user.neighborhood, :user => @user, :neighborhood => @hood)
      end
        @new_vehicle.save
  end
 end
