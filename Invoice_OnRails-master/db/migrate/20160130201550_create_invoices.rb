class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.belongs_to :custumer, index: true, foreign_key: true
      t.integer :numero
      t.date :data
      t.belongs_to :payment_type, index: true, foreign_key: true
      t.belongs_to :tax, index: true, foreign_key: true
      t.decimal :imponibile, :precision => 60, :scale => 2, :default => 0
      t.decimal :totale_iva, :precision => 60, :scale => 2, :default => 0
      t.decimal :totale, :precision => 60, :scale => 2, :default => 0
      t.text :note
      t.boolean :pagato, :default => false

      t.timestamps null: false
    end
  end
end
