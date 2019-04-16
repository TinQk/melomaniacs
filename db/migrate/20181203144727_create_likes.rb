# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user
      t.references :artist
      t.timestamps
    end
  end
end
