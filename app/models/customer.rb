class Customer < ActiveRecord::Base
  has_many :order_lines
  has_many :characters, through: :order_lines
  
  validates_presence_of  :email, :battle_tag, message: "of customer must not be blank."
  validates_uniqueness_of :email, message: "%{value} already exists."

  require 'json'

  scope :sum_of_sales, -> {
    joins(:order_lines).
    select('customers.*, SUM(order_lines.sale) as sum_of_sales').
    group('customers.id')
  }

  scope :avg_of_sales, -> {
    joins(:order_lines).
    select('customers.*, AVG(order_lines.sale) as avg_of_sales').
    group('customers.id')
  }

  scope :count_of_sales, -> {
    joins(:order_lines).
    select('customers.*, COUNT(order_lines.sale) as count_of_sales').
    group('customers.id')
  }

  scope :with_order_totals, -> {
    count_of_sales.
    sum_of_sales.
    avg_of_sales
  }

  def to_label
    self.email
  end

  def self.importJSON(file)
    json = parseJSON file
    customers = json['customers']
    
    customers.each do |row|
      row['email'].downcase!
      row['battle_tag'].downcase!
      row['skype'].downcase!
      Customer.find_or_create_by(email: row['email']) do |customer|
        customer.battle_tag = row['battle_tag']
        customer.skype = row['skype']
      end
    end
  end

  def self.parseJSON(f)
    ActiveSupport::JSON.decode( File.read( f.path ) )
  end

end
