class Lead < OrderLine
  belongs_to :product
  belongs_to :character
  belongs_to :customer
  belongs_to :order_line_status
  belongs_to :payment_status

  default_scope { where(:order_line_status => OrderLineStatus.lead) }

  def is_lead
    self.order_line_status.name == 'lead'
  end

  def self.date_sort
    order(completed_at: :desc, scheduled_at: :desc, created_at: :desc)
  end

  ## Why is this here???
  def complete!
    compelte = OrderLine.find_by(name: 'completed')
    self.update_attributes(order_line_status: complete)
  end
end
