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

ActiveRecord::Schema.define(version: 20160607103600) do

  create_table "calories_bounds", force: :cascade do |t|
    t.decimal  "upper_bound"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "calories_bounds", ["user_id"], name: "index_calories_bounds_on_user_id"

  create_table "diary_entries", force: :cascade do |t|
    t.date     "date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "diary_entries", ["user_id"], name: "index_diary_entries_on_user_id"

  create_table "foods", force: :cascade do |t|
    t.string   "name",                     null: false
    t.decimal  "carbs",      default: 0.0, null: false
    t.decimal  "fat",        default: 0.0, null: false
    t.decimal  "protein",    default: 0.0, null: false
    t.decimal  "sodium",     default: 0.0, null: false
    t.decimal  "sugar",      default: 0.0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "recorded_foods", force: :cascade do |t|
    t.integer  "food_id"
    t.integer  "diary_entry_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "part_of_day"
  end

  add_index "recorded_foods", ["diary_entry_id"], name: "index_recorded_foods_on_diary_entry_id"
  add_index "recorded_foods", ["food_id"], name: "index_recorded_foods_on_food_id"

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end