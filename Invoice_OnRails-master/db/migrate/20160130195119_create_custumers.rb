class CreateCustumers < ActiveRecord::Migration
  def change
    create_table :custumers do |t|
      t.string :denominazione
      t.string :piva
      t.string :codfisc
      t.string :indirizzo
      t.string :cap
      t.string :citta
      t.string :provincia
      t.string :telefono
      t.string :fax
      t.string :cellulare
      t.string :email
      t.string :web
      t.text :note

      t.timestamps null: false
    end
  end
end
