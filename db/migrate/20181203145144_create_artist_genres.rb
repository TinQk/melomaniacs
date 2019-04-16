# frozen_string_literal: true

class CreateArtistGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_genres do |t|
      t.references :artist
      t.references :genre
      t.timestamps
    end
  end
end
