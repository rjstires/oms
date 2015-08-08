class OrderLineStatus < Option
  
  scope :by_status,->(s){where(name: s)}
end
