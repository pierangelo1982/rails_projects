class AddInvoiceToInvoiceArticle < ActiveRecord::Migration
  def change
    add_reference :invoice_articles, :invoice, index: true, foreign_key: true
  end
end
