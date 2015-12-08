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

ActiveRecord::Schema.define(version: 20151208041312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "armor_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string   "spec",              null: false
    t.integer  "armor_type_id",     null: false
    t.integer  "classification_id", null: false
    t.integer  "primary_stat_id",   null: false
    t.integer  "tier_token_id",     null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "characters", ["armor_type_id"], name: "index_characters_on_armor_type_id", using: :btree
  add_index "characters", ["classification_id"], name: "index_characters_on_classification_id", using: :btree
  add_index "characters", ["primary_stat_id"], name: "index_characters_on_primary_stat_id", using: :btree
  add_index "characters", ["tier_token_id"], name: "index_characters_on_tier_token_id", using: :btree

  create_table "classifications", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_contacts", force: :cascade do |t|
    t.integer  "customer_id", null: false
    t.string   "value",       null: false
    t.integer  "ctype",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "customer_contacts", ["customer_id"], name: "index_customer_contacts_on_customer_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "difficulties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_slots", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "title"
    t.text     "description"
    t.integer  "character_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "event_slots", ["character_id"], name: "index_event_slots_on_character_id", using: :btree
  add_index "event_slots", ["event_id"], name: "index_event_slots_on_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "cutoff_timestamp"
    t.datetime "event_timestamp"
    t.integer  "team_id"
    t.integer  "character_id"
    t.integer  "category_id"
    t.integer  "zone_id"
    t.integer  "difficulty_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "events", ["category_id"], name: "index_events_on_category_id", using: :btree
  add_index "events", ["character_id"], name: "index_events_on_character_id", using: :btree
  add_index "events", ["difficulty_id"], name: "index_events_on_difficulty_id", using: :btree
  add_index "events", ["team_id"], name: "index_events_on_team_id", using: :btree
  add_index "events", ["zone_id"], name: "index_events_on_zone_id", using: :btree

  create_table "factions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loot_options", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.boolean  "confirmed",  default: false, null: false
    t.boolean  "owner",      default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "memberships", ["team_id"], name: "index_memberships_on_team_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "mounts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_lines", force: :cascade do |t|
    t.integer  "order"
    t.integer  "product_id",                         null: false
    t.integer  "team_id"
    t.integer  "character_id",                       null: false
    t.integer  "customer_id",                        null: false
    t.integer  "faction_id",                         null: false
    t.integer  "region_id",                          null: false
    t.decimal  "sale",                               null: false
    t.decimal  "merchant_fee",                       null: false
    t.decimal  "site_fee",                           null: false
    t.decimal  "contractor_payment",                 null: false
    t.boolean  "order_paid",         default: false, null: false
    t.boolean  "team_paid",          default: false, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.datetime "completed_at"
    t.datetime "scheduled_at"
  end

  add_index "order_lines", ["character_id"], name: "index_order_lines_on_character_id", using: :btree
  add_index "order_lines", ["customer_id"], name: "index_order_lines_on_customer_id", using: :btree
  add_index "order_lines", ["faction_id"], name: "index_order_lines_on_faction_id", using: :btree
  add_index "order_lines", ["product_id"], name: "index_order_lines_on_product_id", using: :btree
  add_index "order_lines", ["region_id"], name: "index_order_lines_on_region_id", using: :btree
  add_index "order_lines", ["team_id"], name: "index_order_lines_on_team_id", using: :btree

  create_table "payment_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "play_styles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "primary_stats", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "description",    null: false
    t.integer  "category_id",    null: false
    t.integer  "zone_id",        null: false
    t.integer  "play_style_id",  null: false
    t.integer  "loot_option_id", null: false
    t.integer  "mount_id",       null: false
    t.integer  "difficulty_id",  null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["difficulty_id"], name: "index_products_on_difficulty_id", using: :btree
  add_index "products", ["loot_option_id"], name: "index_products_on_loot_option_id", using: :btree
  add_index "products", ["mount_id"], name: "index_products_on_mount_id", using: :btree
  add_index "products", ["play_style_id"], name: "index_products_on_play_style_id", using: :btree
  add_index "products", ["zone_id"], name: "index_products_on_zone_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "name_alias",      null: false
    t.string   "realm",           null: false
    t.string   "payment_address", null: false
    t.integer  "region_id",       null: false
    t.integer  "faction_id",      null: false
    t.integer  "team_status_id",  null: false
    t.integer  "payment_type_id", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "teams", ["faction_id"], name: "index_teams_on_faction_id", using: :btree
  add_index "teams", ["payment_type_id"], name: "index_teams_on_payment_type_id", using: :btree
  add_index "teams", ["region_id"], name: "index_teams_on_region_id", using: :btree
  add_index "teams", ["team_status_id"], name: "index_teams_on_team_status_id", using: :btree

  create_table "tier_tokens", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "battle_tag"
    t.string   "skype"
    t.integer  "role"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "zones", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "characters", "armor_types"
  add_foreign_key "characters", "classifications"
  add_foreign_key "characters", "primary_stats"
  add_foreign_key "characters", "tier_tokens"
  add_foreign_key "customer_contacts", "customers"
  add_foreign_key "event_slots", "characters"
  add_foreign_key "event_slots", "events"
  add_foreign_key "events", "categories"
  add_foreign_key "events", "characters"
  add_foreign_key "events", "difficulties"
  add_foreign_key "events", "teams"
  add_foreign_key "events", "zones"
  add_foreign_key "memberships", "teams"
  add_foreign_key "memberships", "users"
  add_foreign_key "order_lines", "characters"
  add_foreign_key "order_lines", "customers"
  add_foreign_key "order_lines", "factions"
  add_foreign_key "order_lines", "products"
  add_foreign_key "order_lines", "regions"
  add_foreign_key "order_lines", "teams"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "difficulties"
  add_foreign_key "products", "loot_options"
  add_foreign_key "products", "mounts"
  add_foreign_key "products", "play_styles"
  add_foreign_key "products", "zones"
  add_foreign_key "teams", "factions"
  add_foreign_key "teams", "payment_types"
  add_foreign_key "teams", "regions"
  add_foreign_key "teams", "team_statuses"
end
