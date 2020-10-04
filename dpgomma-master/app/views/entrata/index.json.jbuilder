json.array!(@entrata) do |entratum|
  json.extract! entratum, :id, :azienda_id, :mumero, :data, :data_ricezione, :consegnato_da, :imballo, :colli, :riserva, :note
  json.url entratum_url(entratum, format: :json)
end
