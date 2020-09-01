require "json"
require "net/http"
require "uri"
require 'httparty'
require 'byebug'

# uri = URI.parse("https://dev.sighthoundapi.com//v1/recognition?objectType=vehicle,licenseplate")
#
# connection = Net::HTTP.new(uri.host, uri.port)
# connection.use_ssl = true
#
# request = Net::HTTP::Post.new(uri.request_uri)
# request.add_field("X-Access_Token", "MyE9m72PGaLjIlvrhbWirxaXUPTI118kd1BA")
# request.add_field("Content-type", "application/json")
# request.body = {"image" => "https://res.cloudinary.com/argustwo/image/upload/v1596316683/1/IMG_0239.jpg"}.to_json
#
# response = connection.request(request)
# puts response.body

picture = URI("https://res.cloudinary.com/argustwo/image/upload/v1598932975/2/IMG_0239.jpg")
header2 = { 'apikey' => "OCRK6543898A", 'Content-Type' => 'image/jpg' }

 body2 = { 'language' => 'eng', 'url' => picture, 'iscreatesearchablepdf' => false, 'issearchablepdfhidetextlayer' => false, 'filetype' => 'jpg', 'OCREngine' => '2' }

response2 =  HTTParty.post("http://apipro1.ocr.space/parse/image", headers: header2, body: body2)

 puts response2      
debugger


# headers = {
#         "Content-Type": "application/json",
#         "X-Access-Token": "MyE9m72PGaLjIlvrhbWirxaXUPTI118kd1BA"
#       }
#       #carimage = open(pic) {|f| f.read }
#       body = {"image": "https://res.cloudinary.com/argustwo/image/upload/v1596316683/1/IMG_0239.jpg"}.to_json
#
#       response = HTTParty.post("https://dev.sighthoundapi.com//v1/recognition?objectType=vehicle,licenseplate", headers: headers, body: body)
#       response = response.body
#
#       puts JSON.parse(response)
