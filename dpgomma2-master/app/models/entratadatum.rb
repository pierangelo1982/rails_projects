class Entratadatum < ActiveRecord::Base
  belongs_to :entrata
  belongs_to :pezzo
  belongs_to :lavorazione


    before_save :entratadatumtotale
    before_save :entratumtotaleiva
    before_save :entratumtotaleivato

    def entratadatumtotale
      self.entratadatumtotale = (self.quantita * self.lavorazione.prezzo)
    end

    def entratumtotaleiva
      self.entratumtotaleiva = (self.entratadatumtotale * 22/100)
    end

    def entratumtotaleivato
      self.entratumtotaleivato = (self.entratadatumtotale + entratumtotaleiva)
    end

end
