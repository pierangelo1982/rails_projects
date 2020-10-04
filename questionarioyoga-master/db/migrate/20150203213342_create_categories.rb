class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :titolo

      t.timestamps
    end
  end
end
