class AddColumnCostoresoToExitdatum < ActiveRecord::Migration
  def change
    add_column :exitdata, :costoreso, :decimal, :precision => 60, :scale => 4, :default => 0
    add_column :exitdata, :inscatolamentoprezzo, :decimal, :precision => 60, :scale => 4, :default => 0
  end
end
