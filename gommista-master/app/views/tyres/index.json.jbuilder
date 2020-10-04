json.array!(@tyres) do |tyre|
  json.extract! tyre, :id, :car_id, :marca, :modello, :tipologia, :consegna, :ritiro, :km, :usura, :shelf_id, :block_id, :floor_id, :column_id, :created, :modified
  json.url tyre_url(tyre, format: :json)
end
