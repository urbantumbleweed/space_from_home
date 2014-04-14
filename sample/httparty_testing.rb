require 'pry'
require 'httparty'
require 'json'
require_relative '../app/models/keyword'

##This is used to specify the number of results that will be returned
def result_count(num=10)
	return "num=#{num}"	
end

#this method will parse the string captured into query parameters
def get_search_terms(string)
	return "q="+string.join("+")
end

#pulls out words that have a minimum relevance factor. returns an array
def get_keywords(input_text, relevance)
	keywords = Keyword.extract(input_text)
	relevant_words = keywords.select {|w| w["text"] if w["relevance"].to_f > relevance }
	return relevant_words.map{|w| w["text"]}
end

#####base url
base_url = 'http://data.nasa.gov/api/'

#####data retrieval options
get_recent_results = 'get_recent_datasets?'
get_search_results = 'get_search_results/?search='
get_tag = 'get_tag_datasets/?'
slug = 'slug=great-images-in-nasa'


nasa_api_key = '#sthash.vCd7eIFI.dpuf'
# binding.pry
# result = HTTParty.get(base_url+'get_search_results/?search=carbon+cycle#sthash.vCd7eIFI.dpuf')



input = gets.chomp
input = Keyword.get_keywords(input)

ENV['GOOGLE_API_KEY'] = 'AIzaSyAH38Ev4_oSahxXzn27tEcaA1fUmLwZRr8'
ENV['CUSTOM_SEARCH_ID'] = '008746174364381669212:aznfrmyxwcq'


q = "#{get_search_terms(input)}"
key= "key=#{ENV['GOOGLE_API_KEY']}"
cx = "cx=#{ENV['CUSTOM_SEARCH_ID']}"
filter = "filter=1"
imgColorType="imgColorType=color"
imgSize = "imgSize=xlarge"
imgType = "imgType=photo"
num = result_count(5)
safe = "safe=high"
searchType ="searchType=image"
# filter, imgColorType, imgSize, imgType, num, safe, searchType
parameters = [key, cx, q, filter, imgColorType, imgSize, imgType, num, safe, searchType]

base = "https://www.googleapis.com/customsearch/v1?"

url = base + parameters.join('&')

response = HTTParty.get(url)
links = response["items"].map {|el| el["link"]}

binding.pry	 




