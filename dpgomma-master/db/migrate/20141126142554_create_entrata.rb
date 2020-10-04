class CreateEntrata < ActiveRecord::Migration
  def change
    create_table :entrata do |t|
      t.belongs_to :azienda, index: true
      t.string :importaddt
      t.string :numero
      t.date :data
      t.datetime :data_ricezione
      t.string :consegnato_da
      t.string :imballo
      t.string :colli
      t.boolean :riserva, :default => false
      t.boolean :inlavorazione, :default => false
      t.boolean :chiuso, :default => false
      t.boolean :riconsegnato, :default => false
      t.boolean :fatturato, :default => false
      t.boolean :pagato, :default => false
      t.text :note

      t.timestamps
    end
  end
end
