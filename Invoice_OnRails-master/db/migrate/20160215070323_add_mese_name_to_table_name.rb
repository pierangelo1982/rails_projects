class AddMeseNameToTableName < ActiveRecord::Migration
  def change
    add_column :invoices, :rifornimenti, :boolean, :default => false
    add_column :invoices, :mese, :string
    add_column :invoices, :targa, :string
  end
end
