class Exitdatum < ActiveRecord::Base
  belongs_to :azienda
  belongs_to :pezzo
  belongs_to :lavorazione
  belongs_to :exit

  


    before_save :exitdatumtotale
    before_save :exitdatumtotaleiva
    before_save :exitdatumtotaleivato

    def quantitatotale
      self.quantita + self.reso
    end

    def exitdatumtotale
      self.exitdatumtotale = (self.quantita * self.lavorazione.prezzo) + (self.quantita * self.inscatolamentoprezzo) + (self.reso * self.costoreso)
    end

    def exitdatumtotaleiva
      self.exitdatumtotaleiva = (self.exitdatumtotale * 22/100)
    end

    def exitdatumtotaleivato
      self.exitdatumtotaleivato = (self.exitdatumtotale + exitdatumtotaleiva)
    end


end

