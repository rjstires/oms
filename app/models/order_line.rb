class OrderLine < ActiveRecord::Base
  belongs_to :product
  belongs_to :team
  belongs_to :character
  belongs_to :customer
  belongs_to :order_line_status
  belongs_to :payment_status
  
  scope :by_team,->(team) { where(team: team) }
  scope :by_status,->(s) { joins(:order_line_status).merge( OrderLineStatus.by_status(s) ) }
  
  def complete!
    compelte = OrderLine.find_by(name: 'completed')
    self.update_attributes(order_line_status: complete)
  end
end
