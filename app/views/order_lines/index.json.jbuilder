json.array!(@order_lines) do |order_line|
  json.extract! order_line, :id, :order, :product_id, :customer_id, :team_id, :character_id, :order_line_status_id, :payment_status_id, :sale, :merchant_fee, :site_fee, :contractor_payment
  json.url order_line_url(order_line, format: :json)
end
