class CreatePostRelationships < ActiveRecord::Migration
  def change
    create_table :post_relationships do |t|

      t.timestamps
    end
  end
end
