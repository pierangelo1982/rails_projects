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

ActiveRecord::Schema.define(version: 20150113145457) do

  create_table "aziendas", force: true do |t|
    t.string   "denominazione"
    t.string   "piva"
    t.string   "codfisc"
    t.string   "indirizzo"
    t.string   "cap"
    t.string   "citta"
    t.string   "tel"
    t.string   "fax"
    t.string   "cell"
    t.string   "email"
    t.string   "web"
    t.string   "pec"
    t.string   "referente"
    t.text     "note"
    t.string   "logo"
    t.boolean  "active",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entrata", force: true do |t|
    t.integer  "azienda_id"
    t.string   "importaddt"
    t.string   "numero"
    t.date     "data"
    t.datetime "data_ricezione"
    t.string   "consegnato_da"
    t.string   "imballo"
    t.string   "colli"
    t.boolean  "riserva",                                 default: false
    t.boolean  "inlavorazione",                           default: false
    t.boolean  "chiuso",                                  default: false
    t.boolean  "riconsegnato",                            default: false
    t.boolean  "fatturato",                               default: false
    t.boolean  "pagato",                                  default: false
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pezzi_ricevuti"
    t.integer  "pezzi_scartati"
    t.decimal  "entrata_netto",  precision: 60, scale: 2, default: 0.0
  end

  add_index "entrata", ["azienda_id"], name: "index_entrata_on_azienda_id", using: :btree

  create_table "entrata_invoices", force: true do |t|
    t.integer  "invoice_id"
    t.integer  "entrata_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entrata_invoices", ["invoice_id"], name: "index_entrata_invoices_on_invoice_id", using: :btree

  create_table "entratadata", force: true do |t|
    t.integer  "entratum_id"
    t.integer  "pezzo_id"
    t.integer  "lavorazione_id"
    t.text     "note"
    t.integer  "quantita"
    t.integer  "colli"
    t.decimal  "peso",                precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "entratadatumtotale",  precision: 60, scale: 2
    t.decimal  "entratumtotaleivato", precision: 60, scale: 2
    t.decimal  "entratumtotaleiva",   precision: 60, scale: 2
  end

  add_index "entratadata", ["entratum_id"], name: "index_entratadata_on_entratum_id", using: :btree
  add_index "entratadata", ["lavorazione_id"], name: "index_entratadata_on_lavorazione_id", using: :btree
  add_index "entratadata", ["pezzo_id"], name: "index_entratadata_on_pezzo_id", using: :btree

  create_table "exit_entrata", force: true do |t|
    t.integer  "exit_id"
    t.integer  "entratum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exit_entrata", ["entratum_id"], name: "index_exit_entrata_on_entratum_id", using: :btree
  add_index "exit_entrata", ["exit_id"], name: "index_exit_entrata_on_exit_id", using: :btree

  create_table "exits", force: true do |t|
    t.integer  "azienda_id"
    t.date     "data"
    t.integer  "numero"
    t.string   "entratum_ids"
    t.integer  "colli"
    t.integer  "quantita"
    t.integer  "scarti"
    t.decimal  "netto",                  precision: 60, scale: 2
    t.decimal  "tax",                    precision: 60, scale: 2
    t.decimal  "totale",                 precision: 60, scale: 2
    t.text     "note"
    t.string   "tipo_trasporto"
    t.text     "aspetto"
    t.string   "responsabile_trasporto"
    t.text     "altro"
    t.boolean  "consegnato",                                      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exits", ["azienda_id"], name: "index_exits_on_azienda_id", using: :btree

  create_table "invoice_entrata", force: true do |t|
    t.integer  "invoice_id"
    t.integer  "entratum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoice_entrata", ["entratum_id"], name: "index_invoice_entrata_on_entratum_id", using: :btree
  add_index "invoice_entrata", ["invoice_id"], name: "index_invoice_entrata_on_invoice_id", using: :btree

  create_table "invoice_exits", force: true do |t|
    t.integer  "invoice_id"
    t.integer  "exit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoice_exits", ["exit_id"], name: "index_invoice_exits_on_exit_id", using: :btree
  add_index "invoice_exits", ["invoice_id"], name: "index_invoice_exits_on_invoice_id", using: :btree

  create_table "invoices", force: true do |t|
    t.integer  "azienda_id"
    t.date     "data"
    t.integer  "numero"
    t.string   "entratum_ids"
    t.decimal  "netto",        precision: 60, scale: 2
    t.decimal  "tax",          precision: 60, scale: 2
    t.decimal  "totale",       precision: 60, scale: 2
    t.text     "note"
    t.string   "pagamento",                             default: "0"
    t.boolean  "pagato",                                default: false
    t.boolean  "inviata",                               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["azienda_id"], name: "index_invoices_on_azienda_id", using: :btree

  create_table "lavoraziones", force: true do |t|
    t.integer  "pezzo_id"
    t.string   "codice"
    t.string   "titolo"
    t.text     "descrizione"
    t.decimal  "prezzo",      precision: 10, scale: 2
    t.decimal  "decimal",     precision: 10, scale: 2
    t.decimal  "sconto",      precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lavoraziones", ["pezzo_id"], name: "index_lavoraziones_on_pezzo_id", using: :btree

  create_table "pezzos", force: true do |t|
    t.integer  "azienda_id"
    t.string   "codice"
    t.string   "nome"
    t.string   "descrizione"
    t.text     "note"
    t.string   "immagine"
    t.string   "scheda_tecnica"
    t.decimal  "prezzo",         precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pezzos", ["azienda_id"], name: "index_pezzos_on_azienda_id", using: :btree

  create_table "tipopagamentos", force: true do |t|
    t.string   "titolo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
