class PagesController < ApplicationController
   before_action :authenticate_user!

  def fattura
  end

  def entrata
    @azienda = Azienda.all
  end

  def interno
  end

  def exit
  end

  def invoice
  end

  def magazzino
        @aziendas = Azienda.all
       	@entradatum = Entratadatum.all
        @internodatum = Internodatum.all
        @exitdatum = Exitdatum.all
        #@pezzos = Pezzo.find(:all, :conditions => { :azienda_id => azienda.id, :pezzo_id =>  })
  end

end
