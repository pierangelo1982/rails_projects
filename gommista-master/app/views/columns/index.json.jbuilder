json.array!(@columns) do |column|
  json.extract! column, :id, :floor_id, :nome
  json.url column_url(column, format: :json)
end
