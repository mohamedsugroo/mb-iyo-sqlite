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

ActiveRecord::Schema.define(version: 2018_11_18_002746) do

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "site_id"
    t.string "featuredmedia"
    t.string "author_name"
    t.string "author_avatar"
    t.string "tags"
    t.string "author"
    t.string "author_avatars"
    t.string "source_link"
    t.string "post_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.string "baseUrl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.bigint "logo_file_size"
    t.datetime "logo_updated_at"
  end

end
