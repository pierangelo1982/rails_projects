json.array!(@taxations) do |taxation|
  json.extract! taxation, :id, :valore, :titolo, :descrizione
  json.url taxation_url(taxation, format: :json)
end
