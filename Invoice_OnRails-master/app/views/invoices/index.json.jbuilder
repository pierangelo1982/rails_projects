json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :custumer_id, :numero, :data, :payment_type_id, :tax_id, :imponibile, :totale_iva, :totale, :note, :pagato
  json.url invoice_url(invoice, format: :json)
end
