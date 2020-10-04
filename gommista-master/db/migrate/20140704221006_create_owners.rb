class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :denominazione
      t.string :indirizzo
      t.string :cap
      t.string :citta
      t.string :telefono
      t.string :fax
      t.string :cellulare
      t.string :email
      t.string :piva
      t.string :codfisc
      t.string :car
      t.datetime :created
      t.datetime :modified

      t.timestamps
    end
  end
end
