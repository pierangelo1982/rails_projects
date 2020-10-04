json.array!(@questions) do |question|
  json.extract! question, :id, :category_id, :codice, :question, :note
  json.url question_url(question, format: :json)
end
