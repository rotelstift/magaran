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

ActiveRecord::Schema.define(version: 20160301112115) do

  create_table "carriages", force: :cascade do |t|
    t.integer  "magazine_id"
    t.integer  "comic_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "carriages", ["comic_id"], name: "index_carriages_on_comic_id"
  add_index "carriages", ["magazine_id"], name: "index_carriages_on_magazine_id"

  create_table "comic_chapters", force: :cascade do |t|
    t.integer  "number"
    t.string   "subtitle"
    t.integer  "total_point"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "comic_id"
    t.integer  "magazine_volume_id"
  end

  create_table "comics", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "magazine_volumes", force: :cascade do |t|
    t.string   "number"
    t.date     "published"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "magazine_id"
  end

  create_table "magazines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "screen_name"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id",                       null: false
    t.integer  "comic_chapter_id",              null: false
    t.boolean  "loved",                         null: false
    t.text     "impression",       default: "", null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

end
