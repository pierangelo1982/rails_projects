class CreateFloors < ActiveRecord::Migration
  def change
    create_table :floors do |t|
      t.belongs_to :block, index: true
      t.string :nome

      t.timestamps
    end
  end
end
