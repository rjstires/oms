json.array!(@classifications) do |classification|
  json.extract! classification, :id, :name
  json.url admin_classification_url(classification, format: :json)
end
