class AddColumnPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer, after: :id
  end
end
