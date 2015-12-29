class Customer < ActiveRecord::Base
  has_many :order_lines
  has_many :characters, through: :order_lines
  has_many :customer_contacts, dependent: :destroy

  validates  :email, presence: true, uniqueness: true

  require 'json'

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

  def first_battle_tag
    customer_contacts.where(ctype: 'battle_tag').first
  end

  def first_skype
    customer_contacts.where(ctype: 'skype').first
  end

end
