class Exit < ActiveRecord::Base
  belongs_to :azienda
  has_many :exit_entrata, :dependent => :destroy
  has_many :entrata, :through => :exit_entrata

   before_save :netto
   before_save :tax
   before_save :totale


    def netto
      #self.entrata_netto = Entratadatum.sum(:entratadatumtotale, :conditions => {:entratum_id => self.id})
      self.netto = self.entrata.sum(:entrata_netto)
    end

    def tax
      #self.entrata_netto = Entratadatum.sum(:entratadatumtotale, :conditions => {:entratum_id => self.id})
      self.tax = self.netto * 22/100
    end

    def totale
    	self.totale = self.netto + self.tax
    end

    def visione
       "#{azienda.denominazione} -  #{data}  -  #{numero}"
    end

end
