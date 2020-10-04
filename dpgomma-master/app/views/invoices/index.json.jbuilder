json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :azienda_id, :data, :numero, :entrata, :netto, :tax, :totale, :note, :pagamento, :pagato, :inviata
  json.url invoice_url(invoice, format: :json)
end
