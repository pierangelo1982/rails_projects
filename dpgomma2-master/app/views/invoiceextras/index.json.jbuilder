json.array!(@invoiceextras) do |invoiceextra|
  json.extract! invoiceextra, :id, :invoice_id, :codice, :descrizione, :quantita, :prezzo
  json.url invoiceextra_url(invoiceextra, format: :json)
end
