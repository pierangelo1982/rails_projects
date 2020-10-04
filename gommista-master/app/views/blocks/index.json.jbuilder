json.array!(@blocks) do |block|
  json.extract! block, :id, :shelf_id, :nome
  json.url block_url(block, format: :json)
end
