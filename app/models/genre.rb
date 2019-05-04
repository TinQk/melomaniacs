# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :artist_genres, dependent: :destroy
  has_many :artists, through: :artist_genres

  include PgSearch
  pg_search_scope :search_by_name,
                  against: :name,
                  using: {
                    tsearch: { prefix: true }
                  }
end
