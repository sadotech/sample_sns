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

ActiveRecord::Schema.define(version: 20180828003422) do

  create_table "follow_relationships", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
  end

  create_table "post_relationships", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "replying_post_id"
  end

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "reply_relationships", force: true do |t|
    t.integer  "replying_id"
    t.integer  "replied_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "main_post_id"
    t.integer  "reply_post_id"
  end

  create_table "shares", force: true do |t|
    t.integer  "origin_post_id"
    t.integer  "share_post_id"
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
