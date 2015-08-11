class Team < ActiveRecord::Base
  after_create do |t|
    Membership.create!(team: t, user: t.user, confirmed: true, owner: true)
  end
  
  attr_accessor(:user)
  
  belongs_to :region
  belongs_to :faction
  belongs_to :team_status
  belongs_to :payment_type
  
  has_many :memberships # All memberships, regardless.
  
  has_one :owner_membership, -> { where owner: true}, class_name: 'Membership'
  has_many :pending_memberships, -> { where confirmed: false}, class_name: 'Membership'
  has_many :approved_memberships, -> { where confirmed: true}, class_name: 'Membership'
    
  has_one :owner, through: :owner_membership, source: :user
  has_many :pending_members, through: :pending_memberships, source: :user
  has_many :approved_members, through: :approved_memberships, source: :user
  
    
  has_many :order_lines
  
  validates :name, presence: true, uniqueness: true
  
  def display_name
    "#{self.name.titleize} (#{self.id})"
  end
  
end
