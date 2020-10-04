class CreateScriviworks < ActiveRecord::Migration
  def change
    create_table :scriviworks do |t|
      t.belongs_to :extrawork, index: true
      t.string :descrizione
      t.string :codice
      t.integer :quantita
      t.string :importo

      t.timestamps
    end
  end
end
