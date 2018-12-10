class Artist < ApplicationRecord
	has_many :artist_genres
	has_many :genres, through: :artist_genres
	has_many :likes

	include AlgoliaSearch

	algoliasearch do
    attribute :name
  end

end
