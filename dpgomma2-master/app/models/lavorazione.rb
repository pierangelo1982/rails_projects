class Lavorazione < ActiveRecord::Base
  belongs_to :pezzo

  def titoloindex
  	"#{pezzo.nome} -  #{titolo}"
  end


end
