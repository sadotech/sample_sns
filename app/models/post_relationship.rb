class PostRelationship < ActiveRecord::Base
  create_table :relationships do |t|
    t.integer :user_id
    t.integer :post_id
    t.timestamps null: false
  end
  add_index :relationships, :user_id
  add_index :relationships, :post_id
  add_index :relationships, [:user_id, :post_id], unique: true
end
