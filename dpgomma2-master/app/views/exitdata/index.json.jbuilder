json.array!(@exitdata) do |exitdatum|
  json.extract! exitdatum, :id, :azienda_id, :quantita, :pezzo_id, :lavorazione_id, :descrizione
  json.url exitdatum_url(exitdatum, format: :json)
end
