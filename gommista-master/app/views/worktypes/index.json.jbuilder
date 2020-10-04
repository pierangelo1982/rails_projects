json.array!(@worktypes) do |worktype|
  json.extract! worktype, :id, :work_id, :worktypolgy
  json.url worktype_url(worktype, format: :json)
end
