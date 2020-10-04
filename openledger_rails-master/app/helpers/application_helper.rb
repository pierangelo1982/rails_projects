module ApplicationHelper

  # faccio apparire icona a seconda che sia vero o falso il campo booleano
  def icon_tf(status)
    (status == true) ? "thumb_up" : "thumb_down" 
  end

  # formatto cifre decimali
  def money(cifra)
  	number_to_currency(cifra, :unit => "€. ", precision: 2, separator: ",", delimiter: ".")
  end

end
