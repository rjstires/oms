class OrderLineStatus < Option
  has_many :order_lines
  def self.lead
    find_by(name: 'lead')
  end

  def self.completed
    find_by(name: 'completed')
  end

  def self.scheduled
    find_by(name: 'scheduled')
  end
end
