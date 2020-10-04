class CreateInvoiceExits < ActiveRecord::Migration
  def change
    create_table :invoice_exits do |t|
      t.belongs_to :invoice, index: true
      t.belongs_to :exit, index: true

      t.timestamps
    end
  end
end
