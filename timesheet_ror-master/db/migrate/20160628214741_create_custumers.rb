class CreateCustumers < ActiveRecord::Migration
  def change
    create_table :custumers do |t|
      t.string :denominazione
      t.string :nome
      t.string :cognome
      t.string :piva
      t.string :codfisc
      t.string :telefono
      t.string :fax
      t.string :email
      t.string :web
      t.string :indirizzo
      t.string :civico
      t.string :cap
      t.string :citta
      t.float :latitudine
      t.float :longitudine
      t.text :note
      t.string :image

      t.timestamps null: false
    end
  end
end
