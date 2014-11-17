class CreateGamesTags < ActiveRecord::Migration
  def change
    create_table :games_tags do |t|
      t.integer :game_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
