class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :id_of_posted_user
      t.integer :id_of_replied_post
      t.datetime :date_time
      t.string :text_content
      t.integer :image_content_id
      t.integer :id_of_liked_user
      t.integer :id_of_diffusion_user

      t.timestamps
    end
  end
end
