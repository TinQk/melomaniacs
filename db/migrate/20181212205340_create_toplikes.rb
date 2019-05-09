# frozen_string_literal: true

class CreateToplikes < ActiveRecord::Migration[5.2]
  def change
    create_table :toplikes, &:timestamps
  end
end
