class CreateInternodata < ActiveRecord::Migration
  def change
    create_table :internodata do |t|
      t.belongs_to :interno, index: true
      t.string :descrizione
      t.integer :quantita

      t.timestamps
    end
  end
end
