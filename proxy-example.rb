# Ruby proxy example
# https://www.geosurf.com/resources/residential-ips-integration-guide

require "uri"
require 'net/http'

# Our reverse proxy hostname + port, check your address in Dashboard
gs_proxy_addr = 'gw1.geosurf.io'
gs_proxy_port = '8081'

uri = URI.parse("http://www.example.com")
proxy = Net::HTTP::Proxy(gs_proxy_addr, gs_proxy_port)

req = Net::HTTP::Get.new(uri.path)

result = proxy.start(uri.host,uri.port) do |http|
http.request(req)
end

puts result.body
