class Genre < ApplicationRecord
	has_many :artist_genres
	has_many :artists, through: :artist_genres

	include AlgoliaSearch

	algoliasearch do
		attribute :name
		searchableAttributes ['name']
		#customeRanking['desc(likes_count)']
	end
end
