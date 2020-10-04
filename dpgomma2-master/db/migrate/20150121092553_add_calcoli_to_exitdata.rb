class AddCalcoliToExitdata < ActiveRecord::Migration
  def change
    add_column :exitdata, :exitdatumtotale, :decimal, :precision => 60, :scale => 4
    add_column :exitdata, :exitdatumtotaleiva, :decimal, :precision => 60, :scale => 4
    add_column :exitdata, :exitdatumtotaleivato, :decimal, :precision => 60, :scale => 4
  end
end
