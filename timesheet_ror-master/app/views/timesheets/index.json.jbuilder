json.array!(@timesheets) do |timesheet|
  json.extract! timesheet, :id, :worker_id, :custumer_id, :data, :inizio, :fine, :ore, :costo, :location, :latitudine, :longitudine, :latitudine_fine, :longitudine_fine, :note, :confermato
  json.url timesheet_url(timesheet, format: :json)
end
