json.array!(@extralavoroworks) do |extralavorowork|
  json.extract! extralavorowork, :id, :work_id, :lavoro
  json.url extralavorowork_url(extralavorowork, format: :json)
end
