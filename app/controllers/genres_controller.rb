class GenresController < ApplicationController
  before_action :authenticate_user!


  def show
  	@random_artists = []
  	@index = []
    @cover = []
  	@artists = Artist.all
  	RSpotify::authenticate("2fc8c7db0a584ecc97c8789e10b1ba14", "3e31ba14f979474ab69880fafd410829")
    @genre = Genre.find(params[:id])
    10.times do
    	x = rand(0..@genre.artists.count-1)
    	@random_artists << @genre.artists[x].name
    	@index << @genre.artists[x].id
    	@cover << RSpotify::Artist.find("#{@genre.artists[x].spotify_id}").images[1]['url']
    	puts @cover
    end
  end
end
