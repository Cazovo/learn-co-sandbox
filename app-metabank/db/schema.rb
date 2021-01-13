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

ActiveRecord::Schema.define(version: 20210113033206) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created", null: false
    t.string   "type"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "amount"
    t.string   "type"
    t.datetime "date",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.string   "street_name"
    t.string   "city"
    t.string   "zip_code"
    t.string   "number"
    t.datetime "birth_date"
    t.string   "gender"
    t.string   "salary"
    t.string   "occupation"
    t.datetime "updated_at",  null: false
  end

end