class CreateEntratadata < ActiveRecord::Migration
  def change
    create_table :entratadata do |t|
      t.belongs_to :entratum, index: true
      t.belongs_to :pezzo, index: true
      t.belongs_to :lavorazione, index: true
      t.text :note
      t.integer :quantita
      t.integer :colli
      t.decimal :peso, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
