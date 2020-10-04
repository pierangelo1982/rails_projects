class AddColumnsToTyres < ActiveRecord::Migration
  def change
    add_column :tyres, :kit, :boolean
  end
end
