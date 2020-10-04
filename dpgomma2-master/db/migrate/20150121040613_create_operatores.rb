class CreateOperatores < ActiveRecord::Migration
  def change
    create_table :operatores do |t|
      t.string :denominazione
      t.string :nome
      t.string :cognome
      t.string :piva
      t.string :codfisc
      t.string :indirizzo
      t.string :civico
      t.string :cap
      t.string :citta
      t.string :provincia
      t.string :tel
      t.string :fax
      t.string :email
      t.string :note

      t.timestamps
    end
  end
end
