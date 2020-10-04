json.array!(@extraworks) do |extrawork|
  json.extract! extrawork, :id, :car_id, :lavoro, :note, :tempo, :prezzo
  json.url extrawork_url(extrawork, format: :json)
end
