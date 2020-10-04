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

ActiveRecord::Schema.define(version: 20160628220304) do

  create_table "custumers", force: :cascade do |t|
    t.string   "denominazione", limit: 255
    t.string   "nome",          limit: 255
    t.string   "cognome",       limit: 255
    t.string   "piva",          limit: 255
    t.string   "codfisc",       limit: 255
    t.string   "telefono",      limit: 255
    t.string   "fax",           limit: 255
    t.string   "email",         limit: 255
    t.string   "web",           limit: 255
    t.string   "indirizzo",     limit: 255
    t.string   "civico",        limit: 255
    t.string   "cap",           limit: 255
    t.string   "citta",         limit: 255
    t.float    "latitudine",    limit: 24
    t.float    "longitudine",   limit: 24
    t.text     "note",          limit: 65535
    t.string   "image",         limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "timesheets", force: :cascade do |t|
    t.integer  "worker_id",        limit: 4
    t.date     "data"
    t.datetime "inizio"
    t.datetime "fine"
    t.decimal  "ore",                            precision: 60, scale: 2, default: 0.0
    t.decimal  "costo",                          precision: 60, scale: 2, default: 0.0
    t.text     "location",         limit: 65535
    t.float    "latitudine",       limit: 24
    t.float    "longitudine",      limit: 24
    t.boolean  "confermato"
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
    t.float    "latitudine_fine",  limit: 24
    t.float    "longitudine_fine", limit: 24
    t.integer  "custumer_id",      limit: 4
    t.text     "note",             limit: 65535
  end

  add_index "timesheets", ["custumer_id"], name: "index_timesheets_on_custumer_id", using: :btree
  add_index "timesheets", ["worker_id"], name: "index_timesheets_on_worker_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "workers", force: :cascade do |t|
    t.integer  "role_id",    limit: 4
    t.string   "nome",       limit: 255
    t.string   "cognome",    limit: 255
    t.string   "codfisc",    limit: 255
    t.string   "piva",       limit: 255
    t.string   "indirizzo",  limit: 255
    t.string   "cap",        limit: 255
    t.string   "citta",      limit: 255
    t.string   "provincia",  limit: 255
    t.string   "telefono",   limit: 255
    t.string   "cellulare",  limit: 255
    t.decimal  "costo_ora",              precision: 60, scale: 2, default: 0.0
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.boolean  "active"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  add_index "workers", ["role_id"], name: "index_workers_on_role_id", using: :btree

  add_foreign_key "timesheets", "custumers"
  add_foreign_key "timesheets", "workers"
  add_foreign_key "workers", "roles"
end
