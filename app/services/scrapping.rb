require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Scrapping

  def initialize()
  end


  def perform
    scrapping_genre('http://everynoise.com')
  end


  # Method that scraps genres and their URL into an hash
  def scrapping_genre(url)
    doc = Nokogiri::HTML(open(url))
    genres = {}

    # To create our genre database + links
    doc.css("div.genre").each do |div|
      genre = (div.text).tr('»', '')
      id = Genre.create(name: genre).id
      link = 'http://everynoise.com/' + (div.css('a')[0]["href"])
     #scraps artists info
      scrapping_artists(link, id)
    end
  end


  # Method that creates a database of artists with their spotify_Id and genres
  # from a everynoise genre URL
  def scrapping_artists(url, id)
    doc = Nokogiri::HTML(open(url))
    @id = id

    # Goes through all genre divs
    doc.css("div.genre").each do |div|
    # Only takes links that include "spotify" to only take artists and not related genres
      if (div.css('a')[0]["href"]).include?("spotify")
        spotify = div.css('a')[0]["href"].tr('spotify:artist:', '')
        name = div.text.tr('»', '')
      # create an hash with artist name => [spotify_Id, genre]
        a = Artist.create(name: name, spotify_id: spotify)
        a.genres << Genre.find(@id)
      end
    end
  end


end
