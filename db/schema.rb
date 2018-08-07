# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180807010001) do

  create_table "follow_relationships", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_relationships", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.integer  "id_of_posted_user"
    t.integer  "id_of_replied_post"
    t.datetime "date_time"
    t.string   "text_content"
    t.integer  "image_content_id"
    t.integer  "id_of_liked_user"
    t.integer  "id_of_diffusion_user"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "account_id"
    t.string   "email"
    t.string   "password"
    t.string   "name"
    t.integer  "following_users"
    t.integer  "followers"
    t.string   "profile"
    t.integer  "thumbnail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
