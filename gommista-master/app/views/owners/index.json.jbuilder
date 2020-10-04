json.array!(@owners) do |owner|
  json.extract! owner, :id, :denominazione, :indirizzo, :cap, :citta, :telefono, :fax, :cellulare, :email, :piva, :codfisc, :car, :created, :modified
  json.url owner_url(owner, format: :json)
end
