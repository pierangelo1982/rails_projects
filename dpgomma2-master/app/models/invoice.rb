class Invoice < ActiveRecord::Base
  belongs_to :azienda
  belongs_to :taxation
  has_many :invoice_exits, :dependent => :destroy
  has_many :exits, :through => :invoice_exits
  has_many :scadenzapagamentos
  has_many :invoiceextras, :dependent => :destroy
  accepts_nested_attributes_for :exits, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :scadenzapagamentos, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :invoiceextras, :reject_if => :all_blank, :allow_destroy => true




    def number_invoice
      Invoice.where('id <= ?', self.id).where('extract(year  from data)=?', self.data).count 
    end

   before_save :netto
   before_save :tax
   before_save :totale



    def netto
      self.netto = self.exits.sum(:netto) + self.invoiceextras.sum(:prezzo)
    end

    def tax
      self.tax = self.netto * self.taxation.valore/100
    end

    def totale
    	self.totale = self.netto + self.tax
    end

end
