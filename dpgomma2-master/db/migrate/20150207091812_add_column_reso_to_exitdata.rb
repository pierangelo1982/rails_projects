class AddColumnResoToExitdata < ActiveRecord::Migration
  def change
    add_column :exitdata, :reso, :integer, :default => 0
  end
end
