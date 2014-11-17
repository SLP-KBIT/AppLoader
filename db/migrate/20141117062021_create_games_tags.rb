class CreateGamesTags < ActiveRecord::Migration
  def change
    create_table :games_tags do |t|
      t.integer :game_id
      t.integer :tag_id
    end
  end
end
