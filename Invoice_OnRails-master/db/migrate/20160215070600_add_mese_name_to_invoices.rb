class AddMeseNameToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :distributore, :string
  end
end
