class ArtistsController < ApplicationController
  before_action :authenticate_user!

  def show
    RSpotify::authenticate(Rails.application.credentials.spotify_client_id, Rails.application.credentials.spotify_client_secret)
    @artist = Artist.find(params[:id])
    @all = Artist.all
    @genres = Genre.all


    if @artist.spotify_id != nil
      @artist_spotify = RSpotify::Artist.find("#{@artist.spotify_id}")
      @albums = @artist_spotify.albums
      puts @albums
      if @artist_spotify.images != []
        @image = @artist_spotify.images[0]['url']
      end
      @similar = @artist_spotify.related_artists
    end
    @likes = @artist.likes.count
  end

end
