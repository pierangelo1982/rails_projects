class CreateInvoiceEntrata < ActiveRecord::Migration
  def change
    create_table :invoice_entrata do |t|
      t.belongs_to :invoice, index: true
      t.belongs_to :entratum, index: true

      t.timestamps
    end
  end
end
