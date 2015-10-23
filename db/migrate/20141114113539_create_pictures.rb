class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :game_id, null: false
      t.string :picture_file, null: false

      t.timestamps
    end
  end
end
