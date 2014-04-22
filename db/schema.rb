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

ActiveRecord::Schema.define(version: 20140422024948) do

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "page_contents", force: true do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "podcasts", force: true do |t|
    t.integer  "user_id"
    t.integer  "show_id"
    t.string   "title"
    t.string   "audio"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "podcasts", ["user_id", "show_id", "created_at"], name: "index_podcasts_on_user_id_and_show_id_and_created_at"

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
    t.integer  "user_id",    limit: 255
    t.integer  "show_id",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "show_users", ["user_id", "show_id"], name: "index_show_users_on_user_id_and_show_id"

  create_table "shows", force: true do |t|
    t.string   "title"
    t.string   "profile_pic"
    t.string   "description"
    t.string   "fb_page"
    t.string   "tw_page"
    t.string   "ext_page"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "start_day"
    t.string   "end_day"
    t.boolean  "on_air",      default: true
  end

  add_index "shows", ["title"], name: "index_shows_on_title"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_pic"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "level"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "bio"
  end

  add_index "users", ["level"], name: "index_users_on_level"

end
