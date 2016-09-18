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

ActiveRecord::Schema.define(version: 20160918030153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_listings", force: :cascade do |t|
    t.integer "user_listing_id"
    t.integer "searching_group_id"
    t.index ["searching_group_id"], name: "index_group_listings_on_searching_group_id", using: :btree
    t.index ["user_listing_id"], name: "index_group_listings_on_user_listing_id", using: :btree
  end

  create_table "searching_groups", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.text     "location"
    t.integer  "max_number_of_people"
    t.decimal  "max_budget_per_month"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "group_leader"
  end

  create_table "user_listings", force: :cascade do |t|
    t.text     "name"
    t.text     "url"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_listings_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "email"
    t.string   "image"
  end

  create_table "users_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "searching_group_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["searching_group_id"], name: "index_users_groups_on_searching_group_id", using: :btree
    t.index ["user_id"], name: "index_users_groups_on_user_id", using: :btree
  end

  add_foreign_key "group_listings", "searching_groups"
  add_foreign_key "group_listings", "user_listings"
  add_foreign_key "user_listings", "users"
  add_foreign_key "users_groups", "searching_groups"
  add_foreign_key "users_groups", "users"
end
