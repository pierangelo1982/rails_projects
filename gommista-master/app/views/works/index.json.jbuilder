json.array!(@works) do |work|
  json.extract! work, :id, :car, :tyre_id, :worktypology_id, :descrizione, :km, :posteriore, :anteriore, :tempo, :prezzo, :created, :modified
  json.url work_url(work, format: :json)
end
