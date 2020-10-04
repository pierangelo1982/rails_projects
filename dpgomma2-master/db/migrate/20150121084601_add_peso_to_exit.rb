class AddPesoToExit < ActiveRecord::Migration
  def change
    add_column :exits, :pesotot, :decimal, :precision => 60, :scale => 2
  end
end
