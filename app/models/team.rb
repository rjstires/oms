class Team < ActiveRecord::Base
  after_create do |t|
    Membership.create!(team: t, user: t.user, confirmed: true)
  end
  
  belongs_to :user
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, :source => :user
  has_many :order_lines
  has_many :events, inverse_of: :team
  
  validates :name, presence: true, uniqueness: true
  
  def display_name
    "#{self.name.titleize} (#{self.id})"
  end
end
