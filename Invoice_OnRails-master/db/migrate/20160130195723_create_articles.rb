class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :titolo
      t.string :codice
      t.text :descrizione
      t.decimal :prezzo, :precision => 60, :scale => 2

      t.timestamps null: false
    end
  end
end
