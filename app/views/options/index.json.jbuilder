json.array!(@options) do |option|
  json.extract! option, :id, :name, :type
  json.url option_url(option, format: :json)
end
