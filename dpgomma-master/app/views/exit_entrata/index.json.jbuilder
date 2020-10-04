json.array!(@exit_entrata) do |exit_entratum|
  json.extract! exit_entratum, :id, :exit_id, :entratum_id
  json.url exit_entratum_url(exit_entratum, format: :json)
end
