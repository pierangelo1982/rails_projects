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

ActiveRecord::Schema.define(version: 20150226095918) do

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

  create_table "banks", force: true do |t|
    t.integer  "azienda_id"
    t.string   "nome"
    t.string   "abi"
    t.string   "cab"
    t.string   "numeroconto"
    t.string   "iban"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "banks", ["azienda_id"], name: "index_banks_on_azienda_id", using: :btree

  create_table "entrata", force: true do |t|
    t.integer  "azienda_id"
    t.string   "importaddt"
    t.string   "numero"
    t.date     "data"
    t.datetime "data_ricezione"
    t.string   "consegnato_da"
    t.string   "imballo"
    t.string   "colli"
    t.boolean  "riserva",                                          default: false
    t.boolean  "inlavorazione",                                    default: false
    t.boolean  "chiuso",                                           default: false
    t.boolean  "riconsegnato",                                     default: false
    t.boolean  "fatturato",                                        default: false
    t.boolean  "pagato",                                           default: false
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pezzi_ricevuti"
    t.integer  "pezzi_scartati"
    t.decimal  "entrata_netto",           precision: 60, scale: 2
    t.string   "importaddt_file_name"
    t.string   "importaddt_content_type"
    t.integer  "importaddt_file_size"
    t.datetime "importaddt_updated_at"
  end

  add_index "entrata", ["azienda_id"], name: "index_entrata_on_azienda_id", using: :btree

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

  create_table "exitdata", force: true do |t|
    t.integer  "azienda_id"
    t.integer  "quantita",                                      default: 0
    t.integer  "pezzo_id"
    t.integer  "lavorazione_id"
    t.string   "descrizione"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "peso",                 precision: 60, scale: 4
    t.integer  "exit_id"
    t.decimal  "exitdatumtotale",      precision: 60, scale: 4
    t.decimal  "exitdatumtotaleiva",   precision: 60, scale: 4
    t.decimal  "exitdatumtotaleivato", precision: 60, scale: 4
    t.integer  "reso",                                          default: 0
    t.decimal  "costoreso",            precision: 60, scale: 4, default: 0.0
    t.decimal  "inscatolamentoprezzo", precision: 60, scale: 4, default: 0.0
  end

  add_index "exitdata", ["azienda_id"], name: "index_exitdata_on_azienda_id", using: :btree
  add_index "exitdata", ["exit_id"], name: "index_exitdata_on_exit_id", using: :btree
  add_index "exitdata", ["lavorazione_id"], name: "index_exitdata_on_lavorazione_id", using: :btree
  add_index "exitdata", ["pezzo_id"], name: "index_exitdata_on_pezzo_id", using: :btree

  create_table "exits", force: true do |t|
    t.integer  "azienda_id"
    t.date     "data"
    t.integer  "numero"
    t.string   "entratum_ids"
    t.integer  "colli"
    t.integer  "quantita",                                        default: 0
    t.integer  "scarti"
    t.decimal  "netto",                  precision: 60, scale: 4
    t.decimal  "tax",                    precision: 60, scale: 4
    t.decimal  "totale",                 precision: 60, scale: 4
    t.text     "note"
    t.string   "tipo_trasporto"
    t.text     "aspetto"
    t.string   "responsabile_trasporto"
    t.text     "altro"
    t.boolean  "consegnato",                                      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "pesotot",                precision: 60, scale: 4, default: 0.0
  end

  add_index "exits", ["azienda_id"], name: "index_exits_on_azienda_id", using: :btree

  create_table "internodata", force: true do |t|
    t.integer  "interno_id"
    t.string   "descrizione"
    t.integer  "quantita"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lavorazione_id"
  end

  add_index "internodata", ["interno_id"], name: "index_internodata_on_interno_id", using: :btree
  add_index "internodata", ["lavorazione_id"], name: "index_internodata_on_lavorazione_id", using: :btree

  create_table "internos", force: true do |t|
    t.integer  "azienda_id"
    t.integer  "operatore_id"
    t.date     "data"
    t.boolean  "riconsegnato"
    t.string   "rif_ddt"
    t.text     "note"
    t.string   "trasporto"
    t.string   "colli"
    t.string   "aspetto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "internos", ["azienda_id"], name: "index_internos_on_azienda_id", using: :btree
  add_index "internos", ["operatore_id"], name: "index_internos_on_operatore_id", using: :btree

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

  create_table "invoiceextras", force: true do |t|
    t.integer  "invoice_id"
    t.string   "codice"
    t.string   "descrizione"
    t.integer  "quantita"
    t.decimal  "prezzounitario", precision: 60, scale: 4, default: 0.0
    t.decimal  "prezzo",         precision: 60, scale: 4, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoiceextras", ["invoice_id"], name: "index_invoiceextras_on_invoice_id", using: :btree

  create_table "invoices", force: true do |t|
    t.integer  "azienda_id"
    t.date     "data"
    t.integer  "numero"
    t.string   "entratum_ids"
    t.decimal  "netto",        precision: 60, scale: 4, default: 0.0
    t.decimal  "tax",          precision: 60, scale: 4, default: 0.0
    t.decimal  "totale",       precision: 60, scale: 4, default: 0.0
    t.text     "note"
    t.string   "pagamento",                             default: "0"
    t.boolean  "pagato",                                default: false
    t.boolean  "inviata",                               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "taxation_id"
  end

  add_index "invoices", ["azienda_id"], name: "index_invoices_on_azienda_id", using: :btree
  add_index "invoices", ["taxation_id"], name: "index_invoices_on_taxation_id", using: :btree

  create_table "lavoraziones", force: true do |t|
    t.integer  "pezzo_id"
    t.string   "codice"
    t.string   "titolo"
    t.text     "descrizione"
    t.decimal  "prezzo",      precision: 10, scale: 4, default: 0.0
    t.decimal  "decimal",     precision: 10, scale: 4
    t.decimal  "sconto",      precision: 10, scale: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lavoraziones", ["pezzo_id"], name: "index_lavoraziones_on_pezzo_id", using: :btree

  create_table "magazzinos", force: true do |t|
    t.integer  "azienda_id"
    t.integer  "npezzi"
    t.integer  "inlavorazio"
    t.integer  "pronti"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "magazzinos", ["azienda_id"], name: "index_magazzinos_on_azienda_id", using: :btree

  create_table "operatores", force: true do |t|
    t.string   "denominazione"
    t.string   "nome"
    t.string   "cognome"
    t.string   "piva"
    t.string   "codfisc"
    t.string   "indirizzo"
    t.string   "civico"
    t.string   "cap"
    t.string   "citta"
    t.string   "provincia"
    t.string   "tel"
    t.string   "fax"
    t.string   "email"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operators", force: true do |t|
    t.string   "denominazione"
    t.string   "nome"
    t.string   "cognome"
    t.string   "piva"
    t.string   "codfisc"
    t.string   "indirizzo"
    t.string   "civico"
    t.string   "cap"
    t.string   "citta"
    t.string   "provincia"
    t.string   "tel"
    t.string   "fax"
    t.string   "email"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pezzos", force: true do |t|
    t.integer  "azienda_id"
    t.string   "codice"
    t.string   "nome"
    t.string   "descrizione"
    t.text     "note"
    t.string   "immagine"
    t.string   "scheda_tecnica"
    t.decimal  "prezzo",                precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "immagine_file_name"
    t.string   "immagine_content_type"
    t.integer  "immagine_file_size"
    t.datetime "immagine_updated_at"
  end

  add_index "pezzos", ["azienda_id"], name: "index_pezzos_on_azienda_id", using: :btree

  create_table "scadenzapagamentos", force: true do |t|
    t.integer  "invoice_id"
    t.date     "scadenza"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scadenzapagamentos", ["invoice_id"], name: "index_scadenzapagamentos_on_invoice_id", using: :btree

  create_table "taxations", force: true do |t|
    t.integer  "valore"
    t.string   "titolo"
    t.text     "descrizione"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipopagamentos", force: true do |t|
    t.string   "titolo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
