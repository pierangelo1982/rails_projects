class CreateTaxes < ActiveRecord::Migration
  def change
    create_table :taxes do |t|
      t.string :titolo
      t.integer :valore
      t.string :codice
      t.text :descrizione

      t.timestamps null: false
    end
  end
end
