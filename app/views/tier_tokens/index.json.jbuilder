json.array!(@tier_tokens) do |tier_token|
  json.extract! tier_token, :id, :name
  json.url tier_token_url(tier_token, format: :json)
end
