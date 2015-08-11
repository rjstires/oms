class OrderLineStatus < Option
  
  scope :by_status,->(s){where(name: s)}
  
  def self.lead
    find_by(name: 'lead')
  end
  
  def self.completed
    find_by(name: 'completed')
  end
end
