json.array!(@taxes) do |tax|
  json.extract! tax, :id, :titolo, :valore, :codice, :descrizione
  json.url tax_url(tax, format: :json)
end
