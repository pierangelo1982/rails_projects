json.array!(@banks) do |bank|
  json.extract! bank, :id, :azienda_id, :nome, :abi, :cab, :numeroconto, :iban
  json.url bank_url(bank, format: :json)
end
