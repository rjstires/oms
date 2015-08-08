class Customer < ActiveRecord::Base
  has_many :order_lines
  
  def display_name
    self.email
  end
  
  def to_label
    self.email
  end
end
