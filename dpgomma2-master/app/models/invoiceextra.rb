class Invoiceextra < ActiveRecord::Base
  belongs_to :invoice

  before_save :prezzo

  def prezzo
  	self.prezzo = self.quantita * self.prezzounitario
  end

end
