json.array!(@exits) do |exit|
  json.extract! exit, :id, :azienda_id, :data, :numero, :entratum_ids, :colli, :quantita, :scarti, :netto, :tax, :totale, :note, :tipo_trasporto, :aspetto, :responsabile_trasporto, :altro, :consegnato
  json.url exit_url(exit, format: :json)
end
