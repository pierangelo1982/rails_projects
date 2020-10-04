class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.belongs_to :floor, index: true
      t.string :nome

      t.timestamps
    end
  end
end
