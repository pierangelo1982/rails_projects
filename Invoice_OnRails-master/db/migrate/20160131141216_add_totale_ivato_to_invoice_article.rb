class AddTotaleIvatoToInvoiceArticle < ActiveRecord::Migration
  def change
    add_column :invoice_articles, :totale_ivato, :decimal, :precision => 60, :scale => 2
  end
end
