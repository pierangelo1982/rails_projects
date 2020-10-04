json.array!(@shelves) do |shelf|
  json.extract! shelf, :id, :nome
  json.url shelf_url(shelf, format: :json)
end
