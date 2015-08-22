json.array!(@difficulties) do |difficulty|
  json.extract! difficulty, :id, :name
  json.url admin_difficulty_url(difficulty, format: :json)
end
