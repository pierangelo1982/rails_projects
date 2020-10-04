class CreatePurchaseInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_invoice_items do |t|
      t.belongs_to :purchase_invoice, foreign_key: true
      t.string :code
      t.string :name
      t.text :description
      t.integer :quantity, :default => 0
      t.integer :discount, :default => 0
      t.decimal :unit_price, :precision => 60, :scale => 2, :default => 0
      t.belongs_to :tax, foreign_key: true
      t.decimal :price_pretax, :precision => 60, :scale => 2, :default => 0
      t.decimal :tax_price, :precision => 60, :scale => 2, :default => 0
      t.decimal :total_price, :precision => 60, :scale => 2, :default => 0

      t.timestamps
    end
  end
end
