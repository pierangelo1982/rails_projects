class CreateTyres < ActiveRecord::Migration
  def change
    create_table :tyres do |t|
      t.belongs_to :car, index: true
      t.string :marca
      t.string :modello
      t.string :tipologia
      t.datetime :consegna
      t.datetime :ritiro
      t.string :km
      t.string :usura
      t.string :scaffale
      t.string :blocco
      t.string :piano
      t.string :colonna
      t.datetime :created
      t.datetime :modified

      t.timestamps
    end
  end
end
