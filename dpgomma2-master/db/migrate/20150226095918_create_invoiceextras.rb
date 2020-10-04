class CreateInvoiceextras < ActiveRecord::Migration
  def change
    create_table :invoiceextras do |t|
      t.belongs_to :invoice, index: true
      t.string :codice
      t.string :descrizione
      t.integer :quantita, :default => 0
      t.decimal :prezzounitario, :precision => 60, :scale => 4, :default => 0
      t.decimal :prezzo, :precision => 60, :scale => 4, :default => 0

      t.timestamps
    end
  end
end
