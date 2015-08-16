json.array!(@projects) do |project|
  json.extract! project, :id, :project_name, :description, :start_date
  json.url project_url(project, format: :json)
end
