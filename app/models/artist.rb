# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :artist_genres, dependent: :destroy
  has_many :genres, through: :artist_genres
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  include PgSearch
  pg_search_scope :search_by_name,
                  against: :name,
                  using: {
                    tsearch: { prefix: true }
                  }
end
