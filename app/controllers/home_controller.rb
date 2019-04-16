# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def discover
    @reco = []
    @top_artists = []
    @duplicates = []
    @user_likes = current_user.likes.all.reverse
    RSpotify.authenticate(Rails.application.credentials.spotify_client_id, Rails.application.credentials.spotify_client_secret)

    @user_likes.each do |dupli|
      @duplicates << dupli.artist.name
    end

    @user_likes.shuffle.each do |like|
      i = 1
      artists = RSpotify::Artist.find(like.artist.spotify_id).related_artists
      artist = artists[0].name
      while @duplicates.include?(artist) == true
        artist = artists[i].name
        i += 1
      end
      next unless !artist.nil? && @reco.include?(artist) == false && Artist.find_by(name: artist) != nil

      @reco << artist
      break if @reco.size >= 10

      if @duplicates.include?(artists[i].name) == false && @reco.include?(artists[i].name) == false && !artists[i].nil? && Artist.find_by(name: artists[i].name) != nil
        @reco << artists[i].name
        break if @reco.size >= 10
      end
    end
  end
end
