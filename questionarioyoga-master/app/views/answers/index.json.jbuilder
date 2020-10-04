json.array!(@answers) do |answer|
  json.extract! answer, :id, :codice, :question_id, :option, :note
  json.url answer_url(answer, format: :json)
end
