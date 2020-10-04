json.array!(@catextraworks) do |catextrawork|
  json.extract! catextrawork, :id, :nome, :altro, :prezzo
  json.url catextrawork_url(catextrawork, format: :json)
end
