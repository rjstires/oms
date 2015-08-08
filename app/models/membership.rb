class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  validates :user, :team, presence: true
  
  scope :by_user, ->(user) { where(user: user) }
  
end
