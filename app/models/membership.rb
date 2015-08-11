class Membership < ActiveRecord::Base
  before_save do |t|
    Membership.where(:team_id => t.team).update_all(:owner => false) if t.owner == true
  end
    
  belongs_to :user
  belongs_to :team
    
  validates :user, :team, presence: true
  
  scope :by_user, -> (user) { where(user: user) }
  scope :by_team, -> (team) { where(team: team) }
  scope :confirmed, -> { where confirmed: true }
  scope :unconfirmed, -> { where confirmed: false }
  
  scope :owner, -> { where owner: true }
end
