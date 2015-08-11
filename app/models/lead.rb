class Lead < OrderLine
  belongs_to :product
  belongs_to :character
  belongs_to :customer
  belongs_to :order_line_status
  belongs_to :payment_status
    
  default_scope { where(:order_line_status => OrderLineStatus.lead) }
  
  def is_lead
    self.class.name == 'Lead'
  end
  
  def complete!
    compelte = OrderLine.find_by(name: 'completed')
    self.update_attributes(order_line_status: complete)
  end
end
