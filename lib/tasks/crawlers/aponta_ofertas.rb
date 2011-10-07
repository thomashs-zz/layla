require 'rest_client'
require 'json'
load 'utils.rb'
include Utils

args = "rtype=new&cat=turismo&sort=0&search=&cityid=1&point=&page=1&pagesize=50000&zone=-1&coupontype=15&reset=true"
resource = RestClient.get "http://www.apontaofertas.com.br/ajax/CouponJs.aspx?#{args}"
response = JSON.parse resource.to_str
if response["ErrorCode"] != 0
  puts "#{response["ErrorCode"]}: #{response["ErrorDescription"]}"
else
  data = response["Data"]
  print "Found #{data["TotalCoupons"]}"
  print " offers for #{data["CityNameLabel"]} - #{data["StateUF"]}", "\n\n"

  data["CouponsArray"].each do |offer|
    title = offer["Title"]
    provider = offer["ProviderName"]
    begin
      original_url = "http://www.apontaofertas.com.br#{offer["LinkUrl"]}"
      puts "Fetching: #{original_url}"
      url = Utils::follow_redirects original_url
      puts "DONE\n"
    rescue IOException => e
      puts "ERROR: #{e.message}\n"
    end
  end
end
