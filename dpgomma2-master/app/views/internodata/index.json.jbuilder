json.array!(@internodata) do |internodatum|
  json.extract! internodatum, :id, :interno_id, :descrizione, :quantita
  json.url internodatum_url(internodatum, format: :json)
end
