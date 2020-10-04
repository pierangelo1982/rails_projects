class AddColumnArticlesToInvoiceArticles < ActiveRecord::Migration
  def change
    add_column :invoice_articles, :articles, :string
  end
end
