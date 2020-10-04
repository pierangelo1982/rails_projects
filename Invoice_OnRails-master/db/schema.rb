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

ActiveRecord::Schema.define(version: 20160301124043) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "custumer_id", limit: 4
    t.string   "via",         limit: 255
    t.string   "cap",         limit: 255
    t.string   "citta",       limit: 255
    t.string   "provincia",   limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "addresses", ["custumer_id"], name: "index_addresses_on_custumer_id", using: :btree

  create_table "articles", force: :cascade do |t|
    t.string   "titolo",      limit: 255
    t.string   "codice",      limit: 255
    t.text     "descrizione", limit: 65535
    t.decimal  "prezzo",                    precision: 60, scale: 2
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "custumer_banks", force: :cascade do |t|
    t.integer  "custumer_id",  limit: 4
    t.string   "banca",        limit: 255
    t.string   "abi",          limit: 255
    t.string   "cab",          limit: 255
    t.string   "numero_conto", limit: 255
    t.string   "iban",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "custumer_banks", ["custumer_id"], name: "index_custumer_banks_on_custumer_id", using: :btree

  create_table "custumers", force: :cascade do |t|
    t.string   "denominazione", limit: 255
    t.string   "piva",          limit: 255
    t.string   "codfisc",       limit: 255
    t.string   "indirizzo",     limit: 255
    t.string   "cap",           limit: 255
    t.string   "citta",         limit: 255
    t.string   "provincia",     limit: 255
    t.string   "telefono",      limit: 255
    t.string   "fax",           limit: 255
    t.string   "cellulare",     limit: 255
    t.string   "email",         limit: 255
    t.string   "web",           limit: 255
    t.text     "note",          limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "invoice_articles", force: :cascade do |t|
    t.string   "codice",          limit: 255
    t.string   "titolo",          limit: 255
    t.text     "descrizione",     limit: 65535
    t.integer  "quantita",        limit: 4,                              default: 0
    t.decimal  "prezzo_unitario",               precision: 60, scale: 3, default: 0.0
    t.decimal  "importo",                       precision: 60, scale: 3, default: 0.0
    t.integer  "tax_id",          limit: 4,                              default: 0
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
    t.integer  "invoice_id",      limit: 4
    t.decimal  "totale_ivato",                  precision: 60, scale: 3, default: 0.0
    t.string   "articles",        limit: 255
  end

  add_index "invoice_articles", ["invoice_id"], name: "index_invoice_articles_on_invoice_id", using: :btree
  add_index "invoice_articles", ["tax_id"], name: "index_invoice_articles_on_tax_id", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.integer  "custumer_id",     limit: 4
    t.integer  "numero",          limit: 4
    t.date     "data"
    t.integer  "payment_type_id", limit: 4
    t.integer  "tax_id",          limit: 4
    t.decimal  "imponibile",                    precision: 60, scale: 2, default: 0.0
    t.decimal  "totale_iva",                    precision: 60, scale: 2, default: 0.0
    t.decimal  "totale",                        precision: 60, scale: 2, default: 0.0
    t.text     "note",            limit: 65535
    t.boolean  "pagato",                                                 default: false
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
    t.boolean  "rifornimenti",                                           default: false
    t.string   "mese",            limit: 255
    t.string   "targa",           limit: 255
    t.string   "distributore",    limit: 255
    t.string   "cod_comune",      limit: 255
  end

  add_index "invoices", ["custumer_id"], name: "index_invoices_on_custumer_id", using: :btree
  add_index "invoices", ["payment_type_id"], name: "index_invoices_on_payment_type_id", using: :btree
  add_index "invoices", ["tax_id"], name: "index_invoices_on_tax_id", using: :btree

  create_table "payment_deadlines", force: :cascade do |t|
    t.integer  "invoice_id", limit: 4
    t.date     "data"
    t.string   "testo",      limit: 255
    t.text     "note",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "payment_deadlines", ["invoice_id"], name: "index_payment_deadlines_on_invoice_id", using: :btree

  create_table "payment_types", force: :cascade do |t|
    t.string   "titolo",      limit: 255
    t.text     "descrizione", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "taxes", force: :cascade do |t|
    t.string   "titolo",      limit: 255
    t.integer  "valore",      limit: 4
    t.string   "codice",      limit: 255
    t.text     "descrizione", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

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

  add_foreign_key "addresses", "custumers"
  add_foreign_key "custumer_banks", "custumers"
  add_foreign_key "invoice_articles", "invoices"
  add_foreign_key "invoice_articles", "taxes"
  add_foreign_key "invoices", "custumers"
  add_foreign_key "invoices", "payment_types"
  add_foreign_key "invoices", "taxes"
  add_foreign_key "payment_deadlines", "invoices"
end
