json.array!(@scriviworks) do |scriviwork|
  json.extract! scriviwork, :id, :extrawork_id, :descrizione, :codice, :quantita, :importo
  json.url scriviwork_url(scriviwork, format: :json)
end
