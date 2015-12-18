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

ActiveRecord::Schema.define(version: 20151218113051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "wines", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.decimal  "min_price"
    t.decimal  "max_price"
    t.decimal  "retail_price"
    t.string   "type"
    t.string   "year"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "wines", ["max_price"], name: "index_wines_on_max_price", using: :btree
  add_index "wines", ["min_price"], name: "index_wines_on_min_price", using: :btree
  add_index "wines", ["name"], name: "index_wines_on_name", using: :btree
  add_index "wines", ["retail_price"], name: "index_wines_on_retail_price", using: :btree
  add_index "wines", ["type"], name: "index_wines_on_type", using: :btree
  add_index "wines", ["year"], name: "index_wines_on_year", using: :btree

end
