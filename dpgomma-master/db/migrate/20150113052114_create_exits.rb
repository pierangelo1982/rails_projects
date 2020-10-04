class CreateExits < ActiveRecord::Migration
  def change
    create_table :exits do |t|
      t.belongs_to :azienda, index: true
      t.date :data
      t.integer :numero
      t.string :entratum_ids
      t.integer :colli
      t.integer :quantita
      t.integer :scarti
      t.decimal :netto, :precision => 60, :scale => 2
      t.decimal :tax, :precision => 60, :scale => 2
      t.decimal :totale, :precision => 60, :scale => 2
      t.text :note
      t.string :tipo_trasporto
      t.text :aspetto
      t.string :responsabile_trasporto
      t.text :altro
      t.boolean :consegnato, :default => false

      t.timestamps
    end
  end
end
