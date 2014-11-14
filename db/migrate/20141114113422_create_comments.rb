class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :game_id
      t.text :comment
      t.string :contributor

      t.timestamps
    end
  end
end
