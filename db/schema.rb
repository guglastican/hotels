# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_11_15_044138) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "geo_regions", force: :cascade do |t|
    t.integer "geo_state_id", null: false
    t.string "title"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geo_state_id"], name: "index_geo_regions_on_geo_state_id"
  end

  create_table "geo_states", force: :cascade do |t|
    t.string "title"
    t.string "code"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer "organization_id", null: false
    t.string "subject_type", null: false
    t.integer "subject_id", null: false
    t.integer "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_images_on_organization_id"
    t.index ["subject_type", "subject_id"], name: "index_images_on_subject"
  end

  create_table "listings", force: :cascade do |t|
    t.integer "organization_id", null: false
    t.integer "place_id", null: false
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_listings_on_organization_id"
    t.index ["place_id"], name: "index_listings_on_place_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations_users", force: :cascade do |t|
    t.integer "organization_id", null: false
    t.boolean "is_admin", default: false
    t.boolean "is_default", default: false
    t.boolean "is_owner", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["organization_id"], name: "index_organizations_users_on_organization_id"
    t.index ["user_id"], name: "index_organizations_users_on_user_id"
  end

  create_table "place_types", force: :cascade do |t|
    t.string "title"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.integer "place_type_id", null: false
    t.integer "geo_region_id", null: false
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geo_region_id"], name: "index_places_on_geo_region_id"
    t.index ["place_type_id"], name: "index_places_on_place_type_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "key"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "user_agent"
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "verified", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "geo_regions", "geo_states"
  add_foreign_key "images", "organizations"
  add_foreign_key "listings", "organizations"
  add_foreign_key "listings", "places"
  add_foreign_key "organizations_users", "organizations"
  add_foreign_key "places", "geo_regions"
  add_foreign_key "places", "place_types"
  add_foreign_key "sessions", "users"
end
