json.array!(@entratadata) do |entratadatum|
  json.extract! entratadatum, :id, :entrata_id, :pezzo_id, :lavorazione_id, :note, :quantita, :colli, :peso
  json.url entratadatum_url(entratadatum, format: :json)
end
