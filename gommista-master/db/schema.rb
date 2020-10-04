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

ActiveRecord::Schema.define(version: 20150316101958) do

  create_table "blocks", force: true do |t|
    t.integer  "shelf_id"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blocks", ["shelf_id"], name: "index_blocks_on_shelf_id", using: :btree

  create_table "cars", force: true do |t|
    t.string   "targa"
    t.integer  "owner_id"
    t.string   "marca"
    t.string   "modello"
    t.string   "anno"
    t.string   "tyre"
    t.datetime "created"
    t.datetime "modified"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "libretto"
    t.string   "libretto_file_name"
    t.string   "libretto_content_type"
    t.integer  "libretto_file_size"
    t.datetime "libretto_updated_at"
    t.string   "telaio",                default: "0"
  end

  add_index "cars", ["owner_id"], name: "index_cars_on_owner_id", using: :btree

  create_table "catextraworks", force: true do |t|
    t.string   "nome"
    t.string   "altro"
    t.string   "prezzo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "columns", force: true do |t|
    t.integer  "floor_id"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "columns", ["floor_id"], name: "index_columns_on_floor_id", using: :btree

  create_table "extralavoroworks", force: true do |t|
    t.integer  "extrawork_id"
    t.text     "lavoro"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "descrizione"
    t.string   "quantita"
    t.string   "codice"
    t.string   "importo"
    t.integer  "catextrawork_id"
  end

  create_table "extraworks", force: true do |t|
    t.integer  "car_id"
    t.string   "lavoro"
    t.text     "note"
    t.time     "tempo"
    t.string   "prezzo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "data"
    t.string   "km"
    t.string   "descrizione"
  end

  add_index "extraworks", ["car_id"], name: "index_extraworks_on_car_id_id", using: :btree

  create_table "floors", force: true do |t|
    t.integer  "block_id"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "floors", ["block_id"], name: "index_floors_on_block_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "owners", force: true do |t|
    t.string   "denominazione"
    t.string   "indirizzo"
    t.string   "cap"
    t.string   "citta"
    t.string   "telefono"
    t.string   "fax"
    t.string   "cellulare"
    t.string   "email"
    t.string   "piva"
    t.string   "codfisc"
    t.string   "car"
    t.datetime "created"
    t.datetime "modified"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scriviworks", force: true do |t|
    t.integer  "extrawork_id"
    t.string   "descrizione"
    t.string   "codice"
    t.integer  "quantita"
    t.string   "importo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scriviworks", ["extrawork_id"], name: "index_scriviworks_on_extrawork_id", using: :btree

  create_table "shelves", force: true do |t|
    t.string   "nome"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tyres", force: true do |t|
    t.integer  "car_id"
    t.string   "marca"
    t.string   "modello"
    t.string   "tipologia"
    t.datetime "consegna"
    t.datetime "ritiro"
    t.string   "km"
    t.string   "usura"
    t.integer  "location_id"
    t.integer  "shelf_id"
    t.integer  "block_id"
    t.integer  "floor_id",                              null: false
    t.integer  "column_id"
    t.datetime "created"
    t.datetime "modified"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "kit",                   default: false
    t.boolean  "deposito",              default: false
    t.integer  "status",      limit: 1, default: 1,     null: false
  end

  add_index "tyres", ["car_id"], name: "index_tyres_on_car_id", using: :btree

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "roles"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "works", force: true do |t|
    t.integer  "car_id"
    t.integer  "tyre_id"
    t.integer  "worktypology_id"
    t.text     "descrizione"
    t.string   "km"
    t.string   "posteriore"
    t.string   "anteriore"
    t.time     "tempo"
    t.string   "prezzo"
    t.datetime "created"
    t.datetime "modified"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "works", ["tyre_id"], name: "index_works_on_tyre_id", using: :btree
  add_index "works", ["worktypology_id"], name: "index_works_on_worktypology_id", using: :btree

  create_table "worktypes", force: true do |t|
    t.integer  "work_id"
    t.integer  "worktypology_id"
    t.string   "ciao",            limit: 250, default: "0", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "worktypologies", force: true do |t|
    t.string   "nome"
    t.string   "prezzo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
