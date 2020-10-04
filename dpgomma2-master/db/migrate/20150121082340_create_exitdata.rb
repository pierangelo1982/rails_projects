class CreateExitdata < ActiveRecord::Migration
  def change
    create_table :exitdata do |t|
      t.belongs_to :azienda, index: true
      t.integer :quantita
      t.belongs_to :pezzo, index: true
      t.belongs_to :lavorazione, index: true
      t.string :descrizione

      t.timestamps
    end
  end
end
