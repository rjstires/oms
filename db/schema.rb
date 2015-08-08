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

ActiveRecord::Schema.define(version: 20150806020221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string   "spec",              null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "armor_type_id"
    t.integer  "classification_id"
    t.integer  "primary_stat_id"
    t.integer  "tier_token_id"
  end

  add_index "characters", ["armor_type_id"], name: "index_characters_on_armor_type_id", using: :btree
  add_index "characters", ["classification_id"], name: "index_characters_on_classification_id", using: :btree
  add_index "characters", ["primary_stat_id"], name: "index_characters_on_primary_stat_id", using: :btree
  add_index "characters", ["tier_token_id"], name: "index_characters_on_tier_token_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "email",      null: false
    t.string   "battle_tag", null: false
    t.string   "skype",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "team_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "events", ["team_id"], name: "index_events_on_team_id", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.boolean  "confirmed",  default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "memberships", ["team_id"], name: "index_memberships_on_team_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_lines", force: :cascade do |t|
    t.integer  "order"
    t.integer  "product_id",           null: false
    t.integer  "team_id"
    t.integer  "character_id",         null: false
    t.integer  "order_line_status_id", null: false
    t.integer  "payment_status_id",    null: false
    t.decimal  "sale",                 null: false
    t.decimal  "merchant_fee",         null: false
    t.decimal  "site_fee",             null: false
    t.decimal  "contractor_payment",   null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "customer_id"
  end

  add_index "order_lines", ["character_id"], name: "index_order_lines_on_character_id", using: :btree
  add_index "order_lines", ["customer_id"], name: "index_order_lines_on_customer_id", using: :btree
  add_index "order_lines", ["order_line_status_id"], name: "index_order_lines_on_order_line_status_id", using: :btree
  add_index "order_lines", ["payment_status_id"], name: "index_order_lines_on_payment_status_id", using: :btree
  add_index "order_lines", ["product_id"], name: "index_order_lines_on_product_id", using: :btree
  add_index "order_lines", ["team_id"], name: "index_order_lines_on_team_id", using: :btree

  create_table "orders", force: :cascade do |t|
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

  create_table "teams", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["user_id"], name: "index_teams_on_user_id", using: :btree

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "events", "teams"
  add_foreign_key "memberships", "teams"
  add_foreign_key "memberships", "users"
  add_foreign_key "order_lines", "characters"
  add_foreign_key "order_lines", "customers"
  add_foreign_key "order_lines", "products"
  add_foreign_key "order_lines", "teams"
  add_foreign_key "teams", "users"
end
