class ChangeTotaleTypeForInvoices < ActiveRecord::Migration
  def change
  	change_table :invoice_articles do |t|
  		t.change :prezzo_unitario, :decimal, :precision => 60, :scale => 3, :default => 0
  		t.change :importo, :decimal, :precision => 60, :scale => 3, :default => 0
  		t.change :totale_ivato, :decimal, :precision => 60, :scale => 3, :default => 0
  	end
  end
end
