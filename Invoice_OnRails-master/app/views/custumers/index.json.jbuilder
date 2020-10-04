json.array!(@custumers) do |custumer|
  json.extract! custumer, :id, :denominazione, :piva, :codfisc, :indirizzo, :cap, :citta, :provincia, :telefono, :fax, :cellulare, :email, :web, :note
  json.url custumer_url(custumer, format: :json)
end
