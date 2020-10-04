class Product < ApplicationRecord
  belongs_to :product_category, inverse_of: :products
  belongs_to :brand
  belongs_to :supplier, inverse_of: :products
  belongs_to :tax

  before_save :reserved_price
  before_save :warehouse_value

  def reserved_price
  	first_discount = self.price - (self.price * self.supplier.try(:discount).to_i/100) 
  	second_discount =  first_discount - (first_discount * self.discount/100)
  	self.reserved_price = second_discount - (second_discount * self.discount_two/100)
  end

  def warehouse_value
  	self.warehouse_value = self.reserved_price * self.quantity #prezzo scontato * quantita, totale valore prodotto a magazzino
  end

  

end



#:price, 
#:tax_id, 
#:discount, 
#:discount_two, 
#:reserved_price, 
#:selling_price, 
#:quantity, 
#:minimum_quantity, 
#:warehouse_value