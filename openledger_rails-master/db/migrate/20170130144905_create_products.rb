class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :code
      t.belongs_to :product_category, foreign_key: true
      t.belongs_to :brand, foreign_key: true
      t.belongs_to :supplier, foreign_key: true
      t.string :name
      t.text :description
      t.string :position
      t.decimal :price, :precision => 60, :scale => 2, :default => 0
      t.belongs_to :tax, foreign_key: true
      t.integer :discount, :default => 0
      t.integer :discount_two, :default => 0
      t.string :reserved_price, :precision => 60, :scale => 2, :default => 0
      t.decimal :selling_price, :precision => 60, :scale => 2, :default => 0
      t.integer :quantity, :default => 0
      t.integer :minimum_quantity, :default => 0
      t.decimal :warehouse_value, :precision => 60, :scale => 2, :default => 0

      t.timestamps
    end
  end
end
