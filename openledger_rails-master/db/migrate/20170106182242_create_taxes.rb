class CreateTaxes < ActiveRecord::Migration[5.0]
  def change
    create_table :taxes do |t|
      t.string :name
      t.integer :value
      t.text :description

      t.timestamps
    end
  end
end
