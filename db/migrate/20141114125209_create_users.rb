class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :account, null: false, unique: true
      t.string :name, null: false
      t.string :password_digest, null: false
      t.boolean :enable_flag, null: false, default: true
      t.boolean :admin_flag, null: false, default: false
      t.string :icon

      t.timestamps
    end
  end
end
