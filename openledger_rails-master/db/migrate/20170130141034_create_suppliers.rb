class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.text :description
      t.integer :discount, :default => 0

      t.timestamps
    end
  end
end
