json.array!(@suites) do |suite|
  json.extract! suite, :id, :project_id, :suite_name, :description, :case_id
  json.url suite_url(suite, format: :json)
end
