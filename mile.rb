require "net/http"
require "uri"
require "json"
require_relative "helpers/uri_builder"

if ARGV[0].nil?
  puts "Must provide GitHub auth token as first argument"
  exit
end

def title_cleaner(title)
  title.downcase.gsub('v','').gsub(/^\./,'')
end

MAX_PAGES    = 5  # Set the max number of API calls to make
NUM_PER_PAGE = 100 # Max allowed by API is 100

headers = { "Authorization" => "token " + ARGV[0] }
# Initialize empty JSON object to hold parsed JSON from all pages
fullJSON = JSON.parse("[]")
page = 1
until page > MAX_PAGES

  uriBuilder = UriBuilder.new(NUM_PER_PAGE, page)
  uri = uriBuilder.getURI

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(uri.request_uri, headers)
  response = http.request(request)

  # Break out of loop once a page with no milestones is reached
  if response.body == "[]"
    break
  end

  if response.code == "200"
    json = JSON.parse(response.body)
    fullJSON += json
  end
  page += 1
end

milestones = Array.new()
fullJSON.each do |j|
  milestone = title_cleaner(j["title"])
  milestones.push(milestone)
end

puts "The highest release version is v#{milestones.max}"