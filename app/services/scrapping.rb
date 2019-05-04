# frozen_string_literal: true

require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Scrapping
  def initialize; end

  # Method that scraps genres and their URL into an hash
  def scrapping_genre(url)
    doc = Nokogiri::HTML(open(url))

    # To create our genre database + links
    doc.css("div.genre").each do |div|
      genre = div.text.tr('»', '').chop # hash
      id = Genre.create(name: genre).id
      link = 'http://everynoise.com/' + (div.css('a')[0]["href"])
      # scraps artists info
      scrapping_artists(link, id)
    end
  end

  # Method that creates a database of artists with their spotify_Id and genres
  # from a everynoise genre URL
  def scrapping_artists(url, id)
    doc = Nokogiri::HTML(open(url))

    # Goes through all genre divs
    doc.css("div.genre").each do |div|
      # Only takes links that include "spotify" to only take artists and not related genres
      next unless (div.css('a')[0]["href"]).include?("spotify")

      spotify = div.css('a')[0]["href"][15..-1]
      name = div.text.tr('»', '').chop

      # search if Artist already exists in database,
      a = Artist.find_by spotify_id: spotify
      if a.nil?
        # if not, create an artist in the db
        a = Artist.create(name: name, spotify_id: spotify)
      end

      temp = ArtistGenre.new
      temp.artist = a
      temp.genre = Genre.find(id)
      temp.save
    end
  end

  def perform
    scrapping_genre('http://everynoise.com')
  end
end
