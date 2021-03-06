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

ActiveRecord::Schema.define(version: 20150110215915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "individual"
  end

  create_table "contributions", force: true do |t|
    t.integer  "artist_id"
    t.integer  "release_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "role"
  end

  add_index "contributions", ["artist_id", "release_id"], name: "index_contributions_on_artist_id_and_release_id", unique: true, using: :btree
  add_index "contributions", ["artist_id"], name: "index_contributions_on_artist_id", using: :btree
  add_index "contributions", ["release_id"], name: "index_contributions_on_release_id", using: :btree

  create_table "follows", force: true do |t|
    t.integer  "user_id"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "follows", ["artist_id", "user_id"], name: "index_follows_on_artist_id_and_user_id", unique: true, using: :btree
  add_index "follows", ["artist_id"], name: "index_follows_on_artist_id", using: :btree
  add_index "follows", ["user_id"], name: "index_follows_on_user_id", using: :btree

  create_table "memberships", force: true do |t|
    t.integer  "group_id"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "role"
  end

  add_index "memberships", ["group_id", "member_id"], name: "index_memberships_on_group_id_and_member_id", unique: true, using: :btree
  add_index "memberships", ["group_id"], name: "index_memberships_on_group_id", using: :btree
  add_index "memberships", ["member_id"], name: "index_memberships_on_member_id", using: :btree

  create_table "notices", force: true do |t|
    t.integer  "user_id"
    t.integer  "notification_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "notices", ["notification_id"], name: "index_notices_on_notification_id", using: :btree
  add_index "notices", ["user_id", "notification_id"], name: "index_notices_on_user_id_and_notification_id", unique: true, using: :btree
  add_index "notices", ["user_id"], name: "index_notices_on_user_id", using: :btree

  create_table "notifications", force: true do |t|
    t.integer  "release_id"
    t.integer  "release_date_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "notice_id"
  end

  add_index "notifications", ["notice_id"], name: "index_notifications_on_notice_id", using: :btree
  add_index "notifications", ["release_date_id", "release_id"], name: "index_notifications_on_release_date_id_and_release_id", unique: true, using: :btree
  add_index "notifications", ["release_date_id"], name: "index_notifications_on_release_date_id", using: :btree
  add_index "notifications", ["release_id"], name: "index_notifications_on_release_id", using: :btree

  create_table "release_dates", force: true do |t|
    t.date     "date"
    t.integer  "release_id"
    t.string   "region"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "released",   default: false, null: false
  end

  add_index "release_dates", ["date"], name: "index_release_dates_on_date", using: :btree
  add_index "release_dates", ["release_id"], name: "index_release_dates_on_release_id", using: :btree

  create_table "releases", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false, null: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "contributions", "artists"
  add_foreign_key "contributions", "releases"
  add_foreign_key "follows", "artists"
  add_foreign_key "follows", "users"
  add_foreign_key "notices", "notifications"
  add_foreign_key "notices", "users"
  add_foreign_key "notifications", "notices"
  add_foreign_key "notifications", "release_dates", on_delete: :cascade
  add_foreign_key "notifications", "releases"
  add_foreign_key "release_dates", "releases"
end
