class PurchaseInvoice < ApplicationRecord

  has_attached_file :attachment, :default_url => "/bin/local/missing.pdf"
  validates_attachment :attachment, content_type: { content_type: "application/pdf" }
  validates_with AttachmentSizeValidator, :attributes => :attachment, :less_than => 10.megabytes
  
  belongs_to :address_book
  belongs_to :tax, optional: true
  belongs_to :payment_method, optional: true

  has_many :purchase_invoice_items, inverse_of: :purchase_invoice, dependent: :destroy
  accepts_nested_attributes_for :purchase_invoice_items, :reject_if => :all_blank, :allow_destroy => true

  has_many :purchase_payment_deadlines, inverse_of: :purchase_invoice, dependent: :destroy
  accepts_nested_attributes_for :purchase_payment_deadlines, :reject_if => :all_blank, :allow_destroy => true

  before_save :total_pretax
  before_save :total_tax_price
  before_save :total_price


  def total_pretax
    self.total_pretax = self.purchase_invoice_items.sum(:price_pretax)
  end

  def total_tax_price
    self.total_tax_price = self.purchase_invoice_items.sum(:tax_price)
  end

  def total_price
    self.total_price = self.purchase_invoice_items.sum(:total_price)
  end

end
