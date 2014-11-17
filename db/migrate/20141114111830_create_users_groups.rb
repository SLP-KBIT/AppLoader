class CreateUsersGroups < ActiveRecord::Migration
  def change
    create_table :users_groups do |t|
      t.integer :user_id. null: false
      t.integer :group_id, null: false

      t.timestamps
    end
  end
end
