class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.belongs_to :custumer, index: true, foreign_key: true
      t.string :via
      t.string :cap
      t.string :citta
      t.string :provincia

      t.timestamps null: false
    end
  end
end
