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

ActiveRecord::Schema[7.2].define(version: 2025_02_14_033945) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "custom_field_values", force: :cascade do |t|
    t.bigint "custom_field_id"
    t.string "subject_type"
    t.bigint "subject_id"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["custom_field_id"], name: "index_custom_field_values_on_custom_field_id"
    t.index ["subject_type", "subject_id"], name: "index_custom_field_values_on_subject"
  end

  create_table "custom_fields", force: :cascade do |t|
    t.string "key", null: false
    t.string "title"
    t.string "description"
    t.string "subject_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_custom_fields_on_key", unique: true
  end

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

  create_table "listing_types", force: :cascade do |t|
    t.string "title"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.integer "organization_id", null: false
    t.integer "place_id", null: false
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.virtual "searchable", type: :tsvector, as: "(setweight(to_tsvector('english'::regconfig, (COALESCE(title, ''::character varying))::text), 'A'::\"char\") || setweight(to_tsvector('english'::regconfig, COALESCE(description, ''::text)), 'B'::\"char\"))", stored: true
    t.string "booking_url"
    t.string "website_url"
    t.string "instagram_url"
    t.string "facebook_url"
    t.string "phone"
    t.string "email"
    t.bigint "listing_type_id"
    t.index ["listing_type_id"], name: "index_listings_on_listing_type_id"
    t.index ["organization_id"], name: "index_listings_on_organization_id"
    t.index ["place_id"], name: "index_listings_on_place_id"
    t.index ["searchable"], name: "index_listings_on_searchable", using: :gin
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

  create_table "outbound_clicks", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "subject_type"
    t.bigint "subject_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_outbound_clicks_on_organization_id"
    t.index ["subject_type", "subject_id"], name: "index_outbound_clicks_on_subject"
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
    t.virtual "searchable", type: :tsvector, as: "(setweight(to_tsvector('english'::regconfig, (COALESCE(title, ''::character varying))::text), 'A'::\"char\") || setweight(to_tsvector('english'::regconfig, COALESCE(description, ''::text)), 'B'::\"char\"))", stored: true
    t.index ["geo_region_id"], name: "index_places_on_geo_region_id"
    t.index ["place_type_id"], name: "index_places_on_place_type_id"
    t.index ["searchable"], name: "index_places_on_searchable", using: :gin
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "geo_regions", "geo_states"
  add_foreign_key "images", "organizations"
  add_foreign_key "listings", "organizations"
  add_foreign_key "listings", "places"
  add_foreign_key "organizations_users", "organizations"
  add_foreign_key "places", "geo_regions"
  add_foreign_key "places", "place_types"
  add_foreign_key "sessions", "users"
end
