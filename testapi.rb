require "json"
require "net/http"
require "uri"
require 'httparty'

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


headers = {
        "Content-Type": "application/json",
        "X-Access-Token": "MyE9m72PGaLjIlvrhbWirxaXUPTI118kd1BA"
      }
      #carimage = open(pic) {|f| f.read }
      body = {"image": "https://res.cloudinary.com/argustwo/image/upload/v1596316683/1/IMG_0239.jpg"}.to_json

      response = HTTParty.post("https://dev.sighthoundapi.com//v1/recognition?objectType=vehicle,licenseplate", headers: headers, body: body)
      response = response.body

      puts JSON.parse(response)
