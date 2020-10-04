class ChangeCostoOraForWorkers < ActiveRecord::Migration
  def change
  	change_table :workers do |t|
		t.change :costo_ora, :decimal, :precision => 60, :scale => 2, :default => 0
	end
  end
end
