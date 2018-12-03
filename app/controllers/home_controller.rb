class HomeController < ApplicationController

	def index
		RSpotify::authenticate("2fc8c7db0a584ecc97c8789e10b1ba14", "3e31ba14f979474ab69880fafd410829")
		if params[:artist] != nil
		@artists = RSpotify::Artist.search(params[:artist]).first
		
		@image = @artists.images[0]['url']
		puts @image
	    end
	end
	
end
