class CreateBelongings < ActiveRecord::Migration
  def change
    create_table :belongings do |t|
      t.integer :user_id, null: false
      t.integer :group_id, null: false
    end
  end
end
