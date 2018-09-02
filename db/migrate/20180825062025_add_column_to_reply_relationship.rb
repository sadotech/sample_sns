class AddColumnToReplyRelationship < ActiveRecord::Migration
  def change
    add_column :reply_relationships, :main_post_id, :integer
    add_column :reply_relationships, :reply_post_id, :integer
  end
end
