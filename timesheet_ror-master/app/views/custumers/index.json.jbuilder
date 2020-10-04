json.array!(@custumers) do |custumer|
  json.extract! custumer, :id, :denominazione, :nome, :cognome, :piva, :codfisc, :telefono, :fax, :email, :web, :indirizzo, :civico, :cap, :citta, :latitudine, :longitudine, :note, :image
  json.url custumer_url(custumer, format: :json)
end
