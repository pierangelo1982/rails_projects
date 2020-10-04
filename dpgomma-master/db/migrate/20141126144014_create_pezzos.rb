class CreatePezzos < ActiveRecord::Migration
  def change
    create_table :pezzos do |t|
      t.belongs_to :azienda, index: true
      t.string :codice
      t.string :nome
      t.string :descrizione
      t.text :note
      t.string :immagine
      t.string :scheda_tecnica
      t.decimal :prezzo, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
