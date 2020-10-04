class AddAttachmentAttachmentToPurchaseInvoices < ActiveRecord::Migration
  def self.up
    change_table :purchase_invoices do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :purchase_invoices, :attachment
  end
end
