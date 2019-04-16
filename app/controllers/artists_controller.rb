# frozen_string_literal: true

class ArtistsController < ApplicationController
  before_action :authenticate_user!

  def show
    @artist = Artist.find(params[:id])
    @all = Artist.all
    @genres = Genre.all
    @likes = @artist.likes.count
    @comments = @artist.comments.order(:created_at).reverse

    # If we have artist's spotify id in Database
    if !@artist.spotify_id.nil?
      RSpotify.authenticate(Rails.application.credentials.spotify_client_id, Rails.application.credentials.spotify_client_secret)
      @artist_spotify = RSpotify::Artist.find(@artist.spotify_id.to_s)
      @albums = @artist_spotify.albums
      @similar = @artist_spotify.related_artists
      if @artist_spotify.images != []
        @image = @artist_spotify.images[0]['url']
      end
    end
  end
end
