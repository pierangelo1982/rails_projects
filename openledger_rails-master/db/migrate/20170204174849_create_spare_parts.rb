class CreateSpareParts < ActiveRecord::Migration[5.0]
  def change
    create_table :spare_parts do |t|
      t.belongs_to :vehicle_card_acceptance, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.integer :quantity, :default => 0
      t.decimal :unit_price, :precision => 60, :scale => 2, :default => 0
      t.integer :discount, :default => 0
      t.decimal :total_price, :precision => 60, :scale => 2, :default => 0

      t.timestamps
    end
  end
end
