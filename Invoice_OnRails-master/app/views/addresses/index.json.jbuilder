json.array!(@addresses) do |address|
  json.extract! address, :id, :custumer_id, :via, :cap, :citta, :provincia
  json.url address_url(address, format: :json)
end
