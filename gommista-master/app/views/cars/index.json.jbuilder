json.array!(@cars) do |car|
  json.extract! car, :id, :targa, :owner_id, :marca, :modello, :anno, :tyre, :created, :modified
  json.url car_url(car, format: :json)
end
