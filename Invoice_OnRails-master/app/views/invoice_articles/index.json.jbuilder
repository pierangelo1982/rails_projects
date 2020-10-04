json.array!(@invoice_articles) do |invoice_article|
  json.extract! invoice_article, :id, :codice, :titolo, :descrizione, :quantita, :prezzo_unitario, :importo, :tax_id
  json.url invoice_article_url(invoice_article, format: :json)
end
