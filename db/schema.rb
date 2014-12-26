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

ActiveRecord::Schema.define(version: 20141226011551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "artists_releases", id: false, force: true do |t|
    t.integer "artist_id",  null: false
    t.integer "release_id", null: false
  end

  add_index "artists_releases", ["artist_id", "release_id"], name: "index_artists_releases_on_artist_id_and_release_id", using: :btree
  add_index "artists_releases", ["release_id", "artist_id"], name: "index_artists_releases_on_release_id_and_artist_id", using: :btree

  create_table "contributions", force: true do |t|
    t.integer  "artist_id"
    t.integer  "release_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contributions", ["artist_id"], name: "index_contributions_on_artist_id", using: :btree
  add_index "contributions", ["release_id"], name: "index_contributions_on_release_id", using: :btree

  create_table "releases", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contributions", "artists"
  add_foreign_key "contributions", "releases"
end
