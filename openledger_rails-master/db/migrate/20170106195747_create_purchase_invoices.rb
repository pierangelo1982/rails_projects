class CreatePurchaseInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_invoices do |t|
      t.belongs_to :address_book, foreign_key: true
      t.belongs_to :tax, foreign_key: true
      t.integer :invoice_number
      t.date :invoice_date
      t.integer :discount, :default => 0
      t.decimal :total_pretax, :precision => 60, :scale => 2, :default => 0
      t.decimal :total_tax_price, :precision => 60, :scale => 2, :default => 0
      t.decimal :total_price, :precision => 60, :scale => 2, :default => 0
      t.text :note
      t.string :attachment
      t.belongs_to :payment_method, foreign_key: true
      t.boolean :paid, :default => false
      t.text :other

      t.timestamps
    end
  end
end
