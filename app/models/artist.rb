# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :artist_genres
  has_many :genres, through: :artist_genres
  has_many :likes
  has_many :comments
end
