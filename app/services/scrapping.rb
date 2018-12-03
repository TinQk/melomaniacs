require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Scrapping

  def initialize()
  end


  # Method that creates a database of artists with their spotify_Id and genres
  # from a everynoise genre URL
  def scrapping_artists(url, genre)
    doc = Nokogiri::HTML(open(url))

    # Goes through all genre divs
    doc.css("div.genre").each do |div|
    # Only takes links that include "spotify" to only take artists and not related genres
      if (div.css('a')[0]["href"]).include?("spotify")
        spotify = div.css('a')[0]["href"].tr('spotify:artist:', '')
        name = div.text.tr('»', '')
      # create an hash with artist name => [spotify_Id, genre]
        @artists[name] = [spotify, genre]
      end
    end
  end

  # Method that scraps genres and their URL into an hash
  def scrapping_genre(url)
    doc = Nokogiri::HTML(open(url))
    genres = {}
    @artists = {}

    # To create our genre database + links
    doc.css("div.genre").each do |div|
      genre = (div.text).tr('»', '')   #genre name
      link = 'http://everynoise.com/' + (div.css('a')[0]["href"])  #genre url
      scrapping_artists(link, genre)  #scraps artists info
      genres[genre] = link
      puts genres #hash de type {genrename = url}
      puts @artists #hash de type {artistname = spotify_id, genre}
    end
  end


  def perform
    scrapping_genre('http://everynoise.com')
  end

end
