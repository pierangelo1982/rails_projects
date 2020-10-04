json.array!(@pezzos) do |pezzo|
  json.extract! pezzo, :id, :azienda_id, :codice, :nome, :descrizione, :note, :prezzo
  json.url pezzo_url(pezzo, format: :json)
end
