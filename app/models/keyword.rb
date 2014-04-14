require 'alchemy_api'

class Keyword

	  AlchemyAPI.key = '4a7739e43a9d73c15ac064f5cff7ce44a5b7b229'
  AlchemyAPI.configure do |config|
    config.apikey = '4a7739e43a9d73c15ac064f5cff7ce44a5b7b229'
    config.output_mode = :xml # not yet supported
  end


	RELEVANCE = 0.85

	#returns an array of hashes, each with a term and relevance factor
	def self.extract(input)
		 # AlchemyAPI.search(:keyword_extraction, :text => input)
		 return %w(space, hubble, stars)
	end

	#pulls out words that have a minimum relevance factor. returns an array of terms
	def self.get_keywords(input_text)
		keywords = self.extract(input_text)
	
		relevant_words = keywords #.select {|w| w["text"] if w["relevance"].to_f > RELEVANCE }
		# relevant_words.map{|w| w["text"]}
	end


end