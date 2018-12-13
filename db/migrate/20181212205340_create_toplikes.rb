class CreateToplikes < ActiveRecord::Migration[5.2]
  def change
    create_table :toplikes do |t|

      t.timestamps
    end
  end
end
