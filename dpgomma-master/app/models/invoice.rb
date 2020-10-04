class Invoice < ActiveRecord::Base
  belongs_to :azienda
  has_many :invoice_exits, :dependent => :destroy
  has_many :exits, :through => :invoice_exits

   before_save :netto
   before_save :tax
   before_save :totale


    def netto
      self.netto = self.exits.sum(:netto)
    end

    def tax
      self.tax = self.netto * 22/100
    end

    def totale
    	self.totale = self.netto + self.tax
    end

end
