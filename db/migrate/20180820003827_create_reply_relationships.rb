class CreateReplyRelationships < ActiveRecord::Migration
  def change
    create_table :reply_relationships do |t|
      t.integer :replying_id
      t.integer :replied_id

      t.timestamps
    end
  end
end
