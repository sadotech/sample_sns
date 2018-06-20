class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :account_id
      t.string :email
      t.string :password
      t.string :name
      t.integer :following_users
      t.integer :followers
      t.string :profile
      t.integer :thumbnail_id

      t.timestamps
    end
  end
end
