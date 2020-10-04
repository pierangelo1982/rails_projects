class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.belongs_to :azienda, index: true
      t.date :data
      t.integer :numero
      t.string :entratum_ids
      t.decimal :netto, :precision => 60, :scale => 2
      t.decimal :tax, :precision => 60, :scale => 2
      t.decimal :totale, :precision => 60, :scale => 2
      t.text :note
      t.string :pagamento, :default => false
      t.boolean :pagato, :default => false
      t.boolean :inviata, :default => false

      t.timestamps
    end
  end
end
