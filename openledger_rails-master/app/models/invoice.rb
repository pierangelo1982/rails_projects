class Invoice < ApplicationRecord
  belongs_to :address_book
  belongs_to :tax, optional: true
  belongs_to :payment_method, optional: true

  has_many :invoice_items, inverse_of: :invoice, dependent: :destroy
  accepts_nested_attributes_for :invoice_items, :reject_if => :all_blank, :allow_destroy => true

  has_many :payment_deadlines, inverse_of: :invoice, dependent: :destroy
  accepts_nested_attributes_for :payment_deadlines, :reject_if => :all_blank, :allow_destroy => true

  before_save :total_pretax
  before_save :total_tax_price
  before_save :total_price


  def total_pretax
  	self.total_pretax = self.invoice_items.sum(:price_pretax)
  end

  def total_tax_price
  	self.total_tax_price = self.invoice_items.sum(:tax_price)
  end

  def total_price
  	self.total_price = self.invoice_items.sum(:total_price)
  end


end
