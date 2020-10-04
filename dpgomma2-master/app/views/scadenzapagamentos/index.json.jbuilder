json.array!(@scadenzapagamentos) do |scadenzapagamento|
  json.extract! scadenzapagamento, :id, :invoice_id, :scadenza, :note
  json.url scadenzapagamento_url(scadenzapagamento, format: :json)
end
