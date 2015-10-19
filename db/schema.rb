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

ActiveRecord::Schema.define(version: 20151016123831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "belongings", force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "group_id", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "game_id",     null: false
    t.text     "content",     null: false
    t.string   "contributor", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: :cascade do |t|
    t.string   "title",                  null: false
    t.string   "icon",                   null: false
    t.integer  "group_id",               null: false
    t.text     "summary",                null: false
    t.string   "version",                null: false
    t.string   "game_file",              null: false
    t.integer  "dl_count",   default: 0, null: false
    t.string   "movie"
    t.string   "format",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_tags", force: :cascade do |t|
    t.integer "game_id"
    t.integer "tag_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",       null: false
    t.text     "summary",    null: false
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: :cascade do |t|
    t.integer  "game_id",    null: false
    t.string   "picture",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "tag_id",  null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "account",                         null: false
    t.string   "name",                            null: false
    t.string   "password_digest",                 null: false
    t.boolean  "enable_flag",     default: true,  null: false
    t.boolean  "admin_flag",      default: false, null: false
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
