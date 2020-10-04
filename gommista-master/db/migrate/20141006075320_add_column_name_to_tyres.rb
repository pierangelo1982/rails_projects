class AddColumnNameToTyres < ActiveRecord::Migration
  def change
    add_column :tyres, :status, :boolean
  end
end
