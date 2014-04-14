class Search < ActiveRecord::Base

	q = "#{get_search_terms(input)}"
	KEY = "key=#{ENV['GOOGLE_API_KEY']}"
	CX = "cx=#{ENV['CUSTOM_SEARCH_ID']}"
	FILTER = "filter=1"
	IMG_COLOR_TYPE="imgColorType=color"
	IMG_SIZE = "imgSize=xlarge"
	IMG_TYPE = "imgType=photo"
	NUM = result_count
	SAFE = "safe=high"
	SEARCH_TYPE ="searchType=image"
	# filter, imgColorType, imgSize, imgType, num, safe, searchType
	# PARAMETERS = [KEY, CX, Q, FILTER, IMG_COLOR_TYPE, IMG_SIZE, IMG_TYPE, NUM, SAFE, SEARCH_TYPE]

	BASE = "https://www.googleapis.com/customsearch/v1?"

	url = BASE + PARAMETERS.join('&')



	##This is used to specify the number of results that will be returned
	def self.result_count(num=6)
		return "num=#{num}"	
	end

	def self.parameters(query, num)
		return [KEY, CX, query, FILTER, IMG_COLOR_TYPE, IMG_SIZE, IMG_TYPE, num, SAFE, SEARCH_TYPE]
	end

	def self.url(base, parameters)
		return BASE + parameters.join('&')
	end


	def self.response(url)
		 return HTTParty.get(url)
	end

	#array of terms
	def self.img_links(json_response)
		 return json_response["items"].map {|pic| pic["link"]}
	end

		#this method will parse the string captured into query parameters
	def get_search_terms(array_of_terms)
		return "q="+array_of_terms.join("+")
	end


	def get_images()
		
	end

end