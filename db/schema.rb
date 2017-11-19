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

ActiveRecord::Schema.define(version: 20171119055627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.string "serie"
    t.string "color"
    t.integer "money"
    t.text "accesories"
    t.string "status"
    t.string "report"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bills_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.boolean "status"
    t.bigint "user_id"
    t.bigint "bill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_comments_on_bill_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id"
    t.string "auth_token"
    t.datetime "create_at"
    t.datetime "expires_at", default: "2017-11-19 07:57:30"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "role"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
