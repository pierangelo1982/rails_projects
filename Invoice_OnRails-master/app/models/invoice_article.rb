class InvoiceArticle < ActiveRecord::Base
  belongs_to :tax
  belongs_to :invoice

  before_save :importo
  before_save :totale_ivato

  def importo
  	self.importo = self.prezzo_unitario * self.quantita
  end

  def totale_ivato
  	iva = self.importo * self.tax.valore/100
  	self.totale_ivato = self.importo + iva
  end

end
