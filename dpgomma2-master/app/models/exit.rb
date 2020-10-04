class Exit < ActiveRecord::Base
  belongs_to :azienda
  has_many :exit_entrata, :dependent => :destroy
  has_many :entrata, :through => :exit_entrata
  has_many :exitdata, :dependent => :destroy

  accepts_nested_attributes_for :exitdata, :reject_if => :all_blank, :allow_destroy => true

  validates_associated :exitdata

    def number_exit
      Exit.where('id <= ?', self.id).where('extract(year  from data)=?', self.data).count 
    end
    #before_save :totale
    #after_validation :exitdata
    
    #before_save :netto
    #before_save :tax
    before_save :totale



    def netto
      self.netto = self.exitdata.map(&:exitdatumtotale).sum
    end

    def tax
      self.tax = self.netto * 22/100
    end

    def totale
    	self.totale = self.netto + self.tax
    end

    def visione
       "#{azienda.denominazione} -  #{data}  -  #{numero}"
    end

end
