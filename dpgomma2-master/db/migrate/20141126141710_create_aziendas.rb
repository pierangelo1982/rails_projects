class CreateAziendas < ActiveRecord::Migration
  def change
    create_table :aziendas do |t|
      t.string :denominazione
      t.string :piva
      t.string :codfisc
      t.string :indirizzo
      t.string :cap
      t.string :citta
      t.string :tel
      t.string :fax
      t.string :cell
      t.string :email
      t.string :web
      t.string :pec
      t.string :referente
      t.text :note
      t.string :logo
      t.boolean :active, :default => false

      t.timestamps
    end
  end
end
