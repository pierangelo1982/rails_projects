class CreateInternos < ActiveRecord::Migration
  def change
    create_table :internos do |t|
      t.belongs_to :azienda, index: true
      t.belongs_to :operatore, index: true
      t.date :data
      t.boolean :riconsegnato
      t.string :rif_ddt
      t.text :note
      t.string :trasporto
      t.string :colli
      t.string :aspetto
      t.text :note

      t.timestamps
    end
  end
end
