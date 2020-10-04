json.array!(@questionariodata) do |questionariodatum|
  json.extract! questionariodatum, :id, :questionario_id, :question_id, :answer_id
  json.url questionariodatum_url(questionariodatum, format: :json)
end
