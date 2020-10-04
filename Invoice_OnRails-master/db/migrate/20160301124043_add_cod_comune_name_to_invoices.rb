class AddCodComuneNameToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :cod_comune, :string
  end
end
