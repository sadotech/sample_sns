class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :origin_post_id
      t.integer :share_post_id

      t.timestamps
    end
  end
end
