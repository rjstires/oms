class Customer < ActiveRecord::Base
  has_many :order_lines
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
      row.map(&:downcase)
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
