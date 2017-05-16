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

ActiveRecord::Schema.define(version: 20170516205239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.integer  "user_id"
    t.text     "address_1"
    t.text     "address_2"
    t.string   "state"
    t.string   "city"
    t.string   "zip"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "businesses", force: true do |t|
    t.integer  "user_id"
    t.string   "business_email"
    t.string   "business_name"
    t.string   "business_url"
    t.string   "business_phone"
    t.string   "business_fax"
    t.string   "business_federal_tax_id"
    t.string   "business_state_sales_tax_license"
    t.string   "garment_decorated"
    t.string   "product_decorated"
    t.string   "product_resold"
    t.text     "business_type"
    t.string   "heard_about_us"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "businesses", ["user_id"], name: "index_businesses_on_user_id", using: :btree

  create_table "hangtags", force: true do |t|
    t.integer "quote_id"
    t.boolean "placement", default: false
    t.boolean "creation",  default: false
  end

  add_index "hangtags", ["quote_id"], name: "index_hangtags_on_quote_id", using: :btree

  create_table "labels", force: true do |t|
    t.integer "quote_id"
    t.boolean "sewing",   default: false
    t.boolean "creation", default: false
  end

  add_index "labels", ["quote_id"], name: "index_labels_on_quote_id", using: :btree

  create_table "product_production_statuses", force: true do |t|
    t.integer  "product_id"
    t.string   "name"
    t.string   "description"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_production_statuses", ["product_id"], name: "index_product_production_statuses_on_product_id", using: :btree

  create_table "product_properties", force: true do |t|
    t.integer  "product_id"
    t.string   "gender"
    t.string   "category"
    t.string   "dye"
    t.string   "wash"
    t.string   "fabric"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_properties", ["product_id"], name: "index_product_properties_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "qty"
    t.decimal  "price",      default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quotes", force: true do |t|
    t.string   "product_name"
    t.string   "product_style_num"
    t.string   "fabric"
    t.string   "color"
    t.string   "dye"
    t.integer  "qty",               default: 150
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender"
  end

  create_table "size_breakdowns", force: true do |t|
    t.integer "quote_id"
    t.integer "xs"
    t.integer "s"
    t.integer "m"
    t.integer "l"
    t.integer "xl"
    t.integer "xxl"
  end

  add_index "size_breakdowns", ["quote_id"], name: "index_size_breakdowns_on_quote_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "auth_token",             default: ""
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin",                  default: false
    t.boolean  "approved",               default: false
    t.string   "phone"
    t.string   "username"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
