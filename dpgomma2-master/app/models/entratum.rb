class Entratum < ActiveRecord::Base
  has_attached_file :importaddt, :default_url => "/bin/local/missing.pdf"
  validates_attachment :importaddt, content_type: { content_type: "application/pdf" }
  validates_with AttachmentSizeValidator, :attributes => :importaddt, :less_than => 10.megabytes


  belongs_to :azienda
  has_many :pezzos, :through => :azienda
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
