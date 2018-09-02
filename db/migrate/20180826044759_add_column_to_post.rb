class AddColumnToPost < ActiveRecord::Migration
  def change
    add_column :posts, :replying_post_id, :integer
  end
end
