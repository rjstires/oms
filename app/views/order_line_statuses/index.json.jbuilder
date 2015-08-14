json.array!(@order_line_statuses) do |order_line_status|
  json.extract! order_line_status, :id, :name
  json.url order_line_status_url(order_line_status, format: :json)
end
