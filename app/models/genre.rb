# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :artist_genres, dependent: :destroy
  has_many :artists, through: :artist_genres
end
