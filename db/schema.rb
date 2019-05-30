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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2019_05_30_133529) do
=======
ActiveRecord::Schema.define(version: 2019_05_30_130925) do
>>>>>>> ae5131c363f83b5fc1f108b99902b208e5e7fd28

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.float "abv"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "floors", force: :cascade do |t|
    t.integer "floor_number"
    t.string "cups"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kegs", force: :cascade do |t|
    t.bigint "floor_id"
    t.bigint "beer_id"
    t.boolean "full"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beer_id"], name: "index_kegs_on_beer_id"
    t.index ["floor_id"], name: "index_kegs_on_floor_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mods", force: :cascade do |t|
    t.string "name"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "requester_id"
    t.integer "snagger_id"
    t.bigint "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location_id"
    t.string "status"
    t.index ["beer_id"], name: "index_requests_on_beer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name"
    t.integer "mod_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "kegs", "beers"
  add_foreign_key "kegs", "floors"
end
