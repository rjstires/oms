json.array!(@memberships) do |membership|
  json.extract! membership, :id, :user.name, :team.name, :confirmed, :owner
  json.url admin_membership_url(membership, format: :json)
end
