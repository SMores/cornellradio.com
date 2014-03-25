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

ActiveRecord::Schema.define(version: 20140321184654) do

  create_table "page_contents", force: true do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "podcasts", force: true do |t|
    t.integer  "userID"
    t.integer  "showID"
    t.string   "title"
    t.string   "audio"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "podcasts", ["userID", "showID", "created_at"], name: "index_podcasts_on_userID_and_showID_and_created_at"

  create_table "posts", force: true do |t|
    t.integer  "user_id"
    t.integer  "show_id"
    t.string   "title"
    t.string   "blurb"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id", "created_at"], name: "index_posts_on_user_id_and_created_at"

  create_table "sessions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "show_users", force: true do |t|
    t.string   "user_id"
    t.string   "show_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "show_users", ["user_id", "show_id"], name: "index_show_users_on_user_id_and_show_id"

  create_table "shows", force: true do |t|
    t.string   "title"
    t.string   "profilePic"
    t.string   "description"
    t.string   "fbPage"
    t.string   "twPage"
    t.string   "extPage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shows", ["title"], name: "index_shows_on_title"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "profilePic"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "level"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["level"], name: "index_users_on_level"

end
