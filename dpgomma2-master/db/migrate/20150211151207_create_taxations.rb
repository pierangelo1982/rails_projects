class CreateTaxations < ActiveRecord::Migration
  def change
    create_table :taxations do |t|
      t.integer :valore
      t.string :titolo
      t.text :descrizione

      t.timestamps
    end
  end
end
