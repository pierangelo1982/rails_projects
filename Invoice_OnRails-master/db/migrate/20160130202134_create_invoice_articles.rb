class CreateInvoiceArticles < ActiveRecord::Migration
  def change
    create_table :invoice_articles do |t|
      t.string :codice
      t.string :titolo
      t.text :descrizione
      t.integer :quantita, :default => 0
      t.decimal :prezzo_unitario, :precision => 60, :scale => 2
      t.decimal :importo, :precision => 60, :scale => 2, :default => 0
      t.belongs_to :tax, index: true, foreign_key: true, :default => 0

      t.timestamps null: false
    end
  end
end
