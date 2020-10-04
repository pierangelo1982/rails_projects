json.array!(@floors) do |floor|
  json.extract! floor, :id, :block_id, :nome
  json.url floor_url(floor, format: :json)
end
