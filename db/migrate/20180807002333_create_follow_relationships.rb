class CreateFollowRelationships < ActiveRecord::Migration
  def change
    create_table :follow_relationships do |t|

      t.timestamps
    end
  end
end
