json.array!(@custumer_banks) do |custumer_bank|
  json.extract! custumer_bank, :id, :custumer_id, :banca, :abi, :cab, :numero_conto, :iban
  json.url custumer_bank_url(custumer_bank, format: :json)
end
