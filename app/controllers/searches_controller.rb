class SearchesController < ApplicationController

	def index
	 	@ip_addr = request.remote_ip
    @home_from_space = Geocoder.search(@ip_addr).first
		@search_images = 
		@home_from_space = 
		
	end


	def new
		@input = %w(hubble space pictures)
		render @input

	end

	def create
		
	end


	def show
		render text: 'this is the response page'
	end

end