json.array!(@articles) do |article|
  json.extract! article, :id, :titolo, :codice, :descrizione, :prezzo
  json.url article_url(article, format: :json)
end
