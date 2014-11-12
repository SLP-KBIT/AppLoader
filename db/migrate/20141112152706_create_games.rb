class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title, null: false, unique: true
      t.string :icon, null: false
      t.integer :group_id, null: false
      t.text :summary, null: false
      t.string :version, null: false
      t.string :game_file, null: false
      t.integer :dl_count, null: false, default: 0
      t.string :movie
      t.string :format, null: false

      t.timestamps
    end
  end
end
