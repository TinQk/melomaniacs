# frozen_string_literal: true

class GenresController < ApplicationController
  def show
    @reco = []
    @cover = []
    @genre = Genre.find(params[:id])
    @popular = @genre.artists.sort_by{ |t| t[:popularity] }.reverse
    @artists = Artist.all

    RSpotify.authenticate(Rails.application.credentials.spotify_client_id, Rails.application.credentials.spotify_client_secret)

    10.times do |i|
      @image = RSpotify::Artist.find(@popular[i].spotify_id.to_s)
      @cover << if @image.images == []
                  nil
                else
                  @image.images[0]['url']
                end
    end
    @popular.each_with_index do |artist, i|
      artist.genres.each do |genre|
        @reco << genre.id
      end
      break if i == 5
    end
    @freq = @reco.each_with_object(Hash.new(0)) { |v, h| h[v] += 1; }
  end
end
