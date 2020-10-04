json.array!(@locations) do |location|
  json.extract! location, :id, :nome
  json.url location_url(location, format: :json)
end
