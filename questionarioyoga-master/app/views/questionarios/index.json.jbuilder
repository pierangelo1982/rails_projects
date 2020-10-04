json.array!(@questionarios) do |questionario|
  json.extract! questionario, :id, :altro
  json.url questionario_url(questionario, format: :json)
end
