class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false, unique: true
      t.text :summary, null: false
      t.string :icon

      t.timestamps
    end
  end
end
