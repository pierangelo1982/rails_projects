class AddColumnTaxationToInvoices < ActiveRecord::Migration
  def change
    add_reference :invoices, :taxation, index: true, :default => 1
  end
end
