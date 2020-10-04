json.array!(@lavoraziones) do |lavorazione|
  json.extract! lavorazione, :id, :pezo_id, :codice, :titolo, :descrizione, :prezzo, :sconto
  json.url lavorazione_url(lavorazione, format: :json)
end
