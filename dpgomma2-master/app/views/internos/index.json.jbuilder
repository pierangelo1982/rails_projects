json.array!(@internos) do |interno|
  json.extract! interno, :id, :azienda_id, :operatore_id, :data, :riconsegnato, :rif_ddt, :note, :trasporto, :colli, :aspetto, :note
  json.url interno_url(interno, format: :json)
end
