class InvoiceItem < ApplicationRecord
  belongs_to :invoice, inverse_of: :invoice_items
  belongs_to :tax

  before_save :price_pretax
  before_save :tax_price
  before_save :total_price


  def price_pretax
  	self.price_pretax = self.unit_price * self.quantity
  end

  def tax_price
  	self.tax_price = self.price_pretax * self.tax.try(:value).to_i/100
  end

  def total_price
  	self.total_price = self.price_pretax + self.tax_price
  end

end



