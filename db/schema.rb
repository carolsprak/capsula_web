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

ActiveRecord::Schema.define(version: 20180608024854) do

  create_table "boxes", force: :cascade do |t|
    t.integer  "box_limite"
    t.integer  "box_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "brand_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "drink_id_id"
    t.integer  "quantity"
    t.integer  "cart_id_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cart_items", ["cart_id_id"], name: "index_cart_items_on_cart_id_id"
  add_index "cart_items", ["drink_id_id"], name: "index_cart_items_on_drink_id_id"

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drinks", force: :cascade do |t|
    t.string   "drink_type"
    t.string   "drink_category"
    t.text     "description"
    t.integer  "qt_capsule"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "brand_id"
  end

  create_table "orders", force: :cascade do |t|
    t.float    "total_price"
    t.float    "shipping_price"
    t.date     "order_date"
    t.text     "address"
    t.string   "payment_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "cart_id"
  end

  create_table "sales", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "drink_id"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "fullname"
    t.string   "phone_number"
    t.text     "description"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
