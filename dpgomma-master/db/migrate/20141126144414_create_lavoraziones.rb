class CreateLavoraziones < ActiveRecord::Migration
  def change
    create_table :lavoraziones do |t|
      t.belongs_to :pezzo, index: true
      t.string :codice
      t.string :titolo
      t.text :descrizione
      t.decimal :prezzo, :decimal, :precision => 10, :scale => 2
      t.decimal :sconto, :decimal, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
