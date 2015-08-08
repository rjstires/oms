json.array!(@memberships) do |membership|
  json.extract! membership, :id, :user_id, :team_id, :confirmed
  json.url membership_url(membership, format: :json)
end
