# frozen_string_literal: true

class AddPopularityToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :popularity, :integer
  end
end
