json.array!(@customers) do |customer|
  json.extract! customer, :id, :email, :battle_tag, :skype
  json.url customer_url(customer, format: :json)
end
