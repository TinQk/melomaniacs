class GenresController < ApplicationController
  before_action :authenticate_user!


  def show
  	@reco = []
    @cover = []
    @genre = Genre.find(params[:id])
    @popular = @genre.artists.sort_by{ |t| t[:popularity]}.reverse
  	@artists = Artist.all

  	RSpotify::authenticate("2fc8c7db0a584ecc97c8789e10b1ba14", "3e31ba14f979474ab69880fafd410829")
    
    10.times do |i|
      if RSpotify::Artist.find("#{@popular[i].spotify_id}").images != []
        @cover << RSpotify::Artist.find("#{@popular[i].spotify_id}").images[0]['url']
      end
    end
    @genre.artists.each do |artist|
      Artist.find(artist.id).genres.each do |genre|
        @reco << genre.id
      end
      puts @reco
    end
    freq = @reco.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    puts freq
    @reco.max_by { |v| freq[v] }
    10.times do |i|
      puts Genre.find(@reco[i]).name
    end
    


  end
end
