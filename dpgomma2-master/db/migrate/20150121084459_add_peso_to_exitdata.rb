class AddPesoToExitdata < ActiveRecord::Migration
  def change
    add_column :exitdata, :peso, :decimal, :precision => 60, :scale => 2
  end
end
