class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.belongs_to :car
      t.belongs_to :tyre, index: true
      t.belongs_to :worktypology, index: true
      t.text :descrizione
      t.string :km
      t.string :posteriore
      t.string :anteriore
      t.time :tempo
      t.string :prezzo
      t.datetime :created
      t.datetime :modified

      t.timestamps
    end
  end
end
