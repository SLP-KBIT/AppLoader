class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :game_id null: false
      t.string :picture null: false

      t.timestamps
    end
  end
end
