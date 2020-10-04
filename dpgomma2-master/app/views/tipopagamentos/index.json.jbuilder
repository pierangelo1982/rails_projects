json.array!(@tipopagamentos) do |tipopagamento|
  json.extract! tipopagamento, :id, :titolo
  json.url tipopagamento_url(tipopagamento, format: :json)
end
