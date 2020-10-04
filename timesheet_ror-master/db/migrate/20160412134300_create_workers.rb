class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.belongs_to :role, index: true, foreign_key: true
      t.string :nome
      t.string :cognome
      t.string :codfisc
      t.string :piva
      t.string :indirizzo
      t.string :cap
      t.string :citta
      t.string :provincia
      t.string :telefono
      t.string :cellulare
      t.string :costo_ora
      t.string :email
      t.string :password
      t.boolean :active

      t.timestamps null: false
    end
  end
end
