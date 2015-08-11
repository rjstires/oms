class OrderLine < ActiveRecord::Base
  belongs_to :product
  belongs_to :team
  belongs_to :character
  belongs_to :customer
  belongs_to :order_line_status
  belongs_to :payment_status
 
  
  scope :by_team,->(team) { where(team: team) }
  scope :by_status,->(s) { joins(:order_line_status).merge( OrderLineStatus.by_status(s) ) }

  validates :product, presence: true
  validates :character, presence: true
  validates :customer, presence: true

  validates :order_line_status, presence: true
  validates :sale, presence: true
  validates :merchant_fee, presence: true
  validates :site_fee, presence: true
  validates :contractor_payment, presence: true

  validates :order, presence: true, unless: :is_lead
  validates :team, presence: true, unless: :is_lead
  validates :payment_status, presence: true, unless: :is_lead
  
  def is_lead
    self.class.name == 'Lead'
  end
  
  def complete
    self.update_attributes(order_line_status: OrderLineStatus.completed, completed_at: DateTime.now)
  end
    
end
