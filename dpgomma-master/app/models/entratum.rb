class Entratum < ActiveRecord::Base
  belongs_to :azienda
  has_many :entratadata
  accepts_nested_attributes_for :entratadata, :reject_if => :all_blank, :allow_destroy => true

    before_save :entrata_netto


    def entrata_netto
      #self.entrata_netto = Entratadatum.sum(:entratadatumtotale, :conditions => {:entratum_id => self.id})
      self.entrata_netto = self.entratadata.sum(:entratadatumtotale)
    end

    def visione
    	 "#{azienda.denominazione} -  #{data}  -  #{numero}"
    end

end
