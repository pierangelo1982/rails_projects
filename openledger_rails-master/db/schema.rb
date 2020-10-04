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

ActiveRecord::Schema.define(version: 20170204174849) do

  create_table "address_book_banks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "address_book_id"
    t.string   "name"
    t.string   "abi"
    t.string   "cab"
    t.string   "iban"
    t.text     "note",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["address_book_id"], name: "index_address_book_banks_on_address_book_id", using: :btree
  end

  create_table "address_books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "vat"
    t.string   "tax_code"
    t.string   "address"
    t.string   "address_nr"
    t.string   "zip"
    t.string   "city"
    t.string   "country"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "web"
    t.string   "note"
    t.boolean  "customer"
    t.boolean  "supplier"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "attacched_file_name"
    t.string   "attacched_content_type"
    t.integer  "attacched_file_size"
    t.datetime "attacched_updated_at"
    t.string   "attacchment_file_name"
    t.string   "attacchment_content_type"
    t.integer  "attacchment_file_size"
    t.datetime "attacchment_updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.integer  "discount",                  default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoice_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "invoice_id"
    t.string   "code"
    t.string   "name"
    t.text     "description",  limit: 65535
    t.integer  "quantity",                                            default: 0
    t.integer  "discount",                                            default: 0
    t.decimal  "unit_price",                 precision: 60, scale: 2, default: "0.0"
    t.integer  "tax_id"
    t.decimal  "price_pretax",               precision: 60, scale: 2, default: "0.0"
    t.decimal  "tax_price",                  precision: 60, scale: 2, default: "0.0"
    t.decimal  "total_price",                precision: 60, scale: 2, default: "0.0"
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.index ["invoice_id"], name: "index_invoice_items_on_invoice_id", using: :btree
    t.index ["tax_id"], name: "index_invoice_items_on_tax_id", using: :btree
  end

  create_table "invoices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "address_book_id"
    t.integer  "tax_id"
    t.integer  "invoice_number"
    t.date     "invoice_date"
    t.integer  "discount"
    t.decimal  "total_pretax",                    precision: 60, scale: 2, default: "0.0"
    t.decimal  "total_tax_price",                 precision: 60, scale: 2, default: "0.0"
    t.decimal  "total_price",                     precision: 60, scale: 2, default: "0.0"
    t.text     "note",              limit: 65535
    t.integer  "payment_method_id"
    t.boolean  "paid",                                                     default: false
    t.text     "other",             limit: 65535
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.index ["address_book_id"], name: "index_invoices_on_address_book_id", using: :btree
    t.index ["payment_method_id"], name: "index_invoices_on_payment_method_id", using: :btree
    t.index ["tax_id"], name: "index_invoices_on_tax_id", using: :btree
  end

  create_table "payment_deadlines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "invoice_id"
    t.decimal  "price",      precision: 60, scale: 2, default: "0.0"
    t.date     "data"
    t.boolean  "paid",                                default: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.index ["invoice_id"], name: "index_payment_deadlines_on_invoice_id", using: :btree
  end

  create_table "payment_methods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "product_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code"
    t.integer  "product_category_id"
    t.integer  "brand_id"
    t.integer  "supplier_id"
    t.string   "name"
    t.text     "description",         limit: 65535
    t.string   "position"
    t.decimal  "price",                             precision: 60, scale: 2, default: "0.0"
    t.integer  "tax_id"
    t.integer  "discount",                                                   default: 0
    t.integer  "discount_two",                                               default: 0
    t.string   "reserved_price",                                             default: "0"
    t.decimal  "selling_price",                     precision: 60, scale: 2, default: "0.0"
    t.integer  "quantity",                                                   default: 0
    t.integer  "minimum_quantity",                                           default: 0
    t.decimal  "warehouse_value",                   precision: 60, scale: 2, default: "0.0"
    t.datetime "created_at",                                                                 null: false
    t.datetime "updated_at",                                                                 null: false
    t.index ["brand_id"], name: "index_products_on_brand_id", using: :btree
    t.index ["product_category_id"], name: "index_products_on_product_category_id", using: :btree
    t.index ["supplier_id"], name: "index_products_on_supplier_id", using: :btree
    t.index ["tax_id"], name: "index_products_on_tax_id", using: :btree
  end

  create_table "purchase_invoice_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "purchase_invoice_id"
    t.string   "code"
    t.string   "name"
    t.text     "description",         limit: 65535
    t.integer  "quantity",                                                   default: 0
    t.integer  "discount",                                                   default: 0
    t.decimal  "unit_price",                        precision: 60, scale: 2, default: "0.0"
    t.integer  "tax_id"
    t.decimal  "price_pretax",                      precision: 60, scale: 2, default: "0.0"
    t.decimal  "tax_price",                         precision: 60, scale: 2, default: "0.0"
    t.decimal  "total_price",                       precision: 60, scale: 2, default: "0.0"
    t.datetime "created_at",                                                                 null: false
    t.datetime "updated_at",                                                                 null: false
    t.index ["purchase_invoice_id"], name: "index_purchase_invoice_items_on_purchase_invoice_id", using: :btree
    t.index ["tax_id"], name: "index_purchase_invoice_items_on_tax_id", using: :btree
  end

  create_table "purchase_invoices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "address_book_id"
    t.integer  "tax_id"
    t.integer  "invoice_number"
    t.date     "invoice_date"
    t.integer  "discount"
    t.decimal  "total_pretax",                          precision: 60, scale: 2, default: "0.0"
    t.decimal  "total_tax_price",                       precision: 60, scale: 2, default: "0.0"
    t.decimal  "total_price",                           precision: 60, scale: 2, default: "0.0"
    t.text     "note",                    limit: 65535
    t.string   "attachment"
    t.integer  "payment_method_id"
    t.boolean  "paid",                                                           default: false
    t.text     "other",                   limit: 65535
    t.datetime "created_at",                                                                     null: false
    t.datetime "updated_at",                                                                     null: false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.index ["address_book_id"], name: "index_purchase_invoices_on_address_book_id", using: :btree
    t.index ["payment_method_id"], name: "index_purchase_invoices_on_payment_method_id", using: :btree
    t.index ["tax_id"], name: "index_purchase_invoices_on_tax_id", using: :btree
  end

  create_table "purchase_payment_deadlines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "purchase_invoice_id"
    t.decimal  "price",               precision: 60, scale: 2, default: "0.0"
    t.date     "data"
    t.boolean  "paid",                                         default: false
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.index ["purchase_invoice_id"], name: "index_purchase_payment_deadlines_on_purchase_invoice_id", using: :btree
  end

  create_table "spare_parts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "vehicle_card_acceptance_id"
    t.integer  "product_id"
    t.integer  "quantity",                                            default: 0
    t.decimal  "unit_price",                 precision: 60, scale: 2, default: "0.0"
    t.integer  "discount",                                            default: 0
    t.decimal  "total_price",                precision: 60, scale: 2, default: "0.0"
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.index ["product_id"], name: "index_spare_parts_on_product_id", using: :btree
    t.index ["vehicle_card_acceptance_id"], name: "index_spare_parts_on_vehicle_card_acceptance_id", using: :btree
  end

  create_table "suppliers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.integer  "discount",                  default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "taxes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "value"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "vehicle_card_acceptances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "date_vehicle_reception"
    t.integer  "employee_id"
    t.integer  "document_number"
    t.integer  "address_book_id"
    t.integer  "km"
    t.string   "serial_number"
    t.string   "vehicle_year"
    t.datetime "vehicle_registered_in"
    t.string   "vehicle_model"
    t.text     "note",                   limit: 65535
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["address_book_id"], name: "index_vehicle_card_acceptances_on_address_book_id", using: :btree
    t.index ["employee_id"], name: "index_vehicle_card_acceptances_on_employee_id", using: :btree
  end

  add_foreign_key "address_book_banks", "address_books"
  add_foreign_key "invoice_items", "invoices"
  add_foreign_key "invoice_items", "taxes"
  add_foreign_key "invoices", "address_books"
  add_foreign_key "invoices", "payment_methods"
  add_foreign_key "invoices", "taxes"
  add_foreign_key "payment_deadlines", "invoices"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products", "suppliers"
  add_foreign_key "products", "taxes"
  add_foreign_key "purchase_invoice_items", "purchase_invoices"
  add_foreign_key "purchase_invoice_items", "taxes"
  add_foreign_key "purchase_invoices", "address_books"
  add_foreign_key "purchase_invoices", "payment_methods"
  add_foreign_key "purchase_invoices", "taxes"
  add_foreign_key "purchase_payment_deadlines", "purchase_invoices"
  add_foreign_key "spare_parts", "products"
  add_foreign_key "spare_parts", "vehicle_card_acceptances"
  add_foreign_key "vehicle_card_acceptances", "address_books"
  add_foreign_key "vehicle_card_acceptances", "employees"
end
