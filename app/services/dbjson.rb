require 'rubygems'
require 'json'

class Dbjson

  def initialize()
  end

  #
  def convert_genres_to_json()
    genres = []
    Genre.all.each do |genre|
      genres << genre
    end

    genres_json = genres.to_json

    File.open('genres.json', 'w') do |f|
      f.write(genres_json)
    end

  end

  def perform()
    convert_genres_to_json
  end

end
