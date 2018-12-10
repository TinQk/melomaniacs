class ArtistsController < ApplicationController
  before_action :authenticate_user!

  def show

    @artist = Artist.find(params[:id])

    @all = Artist.all

    RSpotify::authenticate("2fc8c7db0a584ecc97c8789e10b1ba14", "3e31ba14f979474ab69880fafd410829")
    if @artist.spotify_id != nil
      @artist_spotify = RSpotify::Artist.find("#{@artist.spotify_id}")
      puts "***********"
      puts @artist.spotify_id
      @image = @artist_spotify.images[0]['url']
      puts @image
      @similar = @artist_spotify.related_artists


    end

    @likes = @artist.likes.count

  end

end
