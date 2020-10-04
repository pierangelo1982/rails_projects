class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.belongs_to :shelf, index: true
      t.string :nome

      t.timestamps
    end
  end
end
