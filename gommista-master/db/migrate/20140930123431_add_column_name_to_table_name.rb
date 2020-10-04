class AddColumnNameToTableName < ActiveRecord::Migration
  def change
    add_column :extralavoroworks, :descrizione, :string
    add_column :extralavoroworks, :quantita, :string
    add_column :extralavoroworks, :codice, :string
    add_column :extralavoroworks, :importo, :string
  end
end
