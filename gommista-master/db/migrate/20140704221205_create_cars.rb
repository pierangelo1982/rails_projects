class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :targa
      t.belongs_to :owner, index: true
      t.string :marca
      t.string :modello
      t.string :anno
      t.string :tyre
      t.datetime :created
      t.datetime :modified

      t.timestamps
    end
  end
end
