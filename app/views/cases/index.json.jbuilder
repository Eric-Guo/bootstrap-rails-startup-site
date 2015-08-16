json.array!(@cases) do |case|
  json.extract! case, :id, :project_id, :case_name, :description, :tester_user_id
  json.url case_url(case, format: :json)
end
