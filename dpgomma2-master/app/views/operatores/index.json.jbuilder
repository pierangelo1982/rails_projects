json.array!(@operatores) do |operatore|
  json.extract! operatore, :id, :denominazione, :nome, :cognome, :piva, :codfisc, :indirizzo, :civico, :cap, :citta, :provincia, :tel, :fax, :email, :note
  json.url operatore_url(operatore, format: :json)
end
