json.array!(@aziendas) do |azienda|
  json.extract! azienda, :id, :denominazione, :piva, :codfisc, :indirizzo, :cap, :citta, :tel, :fax, :cell, :email, :web, :pec, :referente, :note, :logo, :active
  json.url azienda_url(azienda, format: :json)
end
