class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :game_id, null: false
      t.text :comment, null: false
      t.string :contributor, null: false

      t.timestamps
    end
  end
end
