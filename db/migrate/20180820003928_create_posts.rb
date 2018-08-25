class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.timestamps

      t.belongs_to :user
    end
  end
end
