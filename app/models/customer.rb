class Customer < ActiveRecord::Base
  has_many :order_lines
  has_many :characters, through: :order_lines
  
  validates_presence_of  :email, :battle_tag, message: "of customer must not be blank."
  validates_uniqueness_of :email, message: "%{value} already exists."


  require 'json'

  def display_name
    self.email
  end

  def to_label
    self.email
  end

  def self.importJSON(file)
    json = parseJSON file
    customers = json['customers']
    Customer.delete_all
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
