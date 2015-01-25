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

ActiveRecord::Schema.define(version: 20150125130953) do

  create_table "people", force: :cascade do |t|
    t.string   "firstName",  limit: 255
    t.string   "middleName", limit: 255
    t.string   "lastName",   limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "isActive",   limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "userName",      limit: 255
    t.string   "email",         limit: 255
    t.boolean  "isActive",      limit: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "password_hash", limit: 255
    t.string   "password_salt", limit: 255
    t.integer  "role_id",       limit: 4
    t.integer  "person_id",     limit: 4
  end

  add_index "users", ["person_id"], name: "fk_rails_f1b3c05f9f", using: :btree
  add_index "users", ["role_id"], name: "fk_rails_13db0a368d", using: :btree

  add_foreign_key "users", "people"
  add_foreign_key "users", "roles"
end
