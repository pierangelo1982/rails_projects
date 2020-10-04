json.array!(@worktypologies) do |worktypology|
  json.extract! worktypology, :id, :nome, :prezzo
  json.url worktypology_url(worktypology, format: :json)
end
