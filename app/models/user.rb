class User < ActiveRecord::Base
  enum role: [:registered, :approved, :admin]
  
  after_initialize :set_default_role, :if => :new_record?
  
  has_many :owned_teams, :class_name => 'Team'
  
  has_many :owner_membership, -> { where owner: true}, class_name: 'Membership'
  has_many :pending_memberships, -> { where confirmed: false}, class_name: 'Membership'
  has_many :approved_memberships, -> { where confirmed: true}, class_name: 'Membership'
  
  has_many :owned_teams, through: :owner_membership, source: :team
  has_many :pending_teams, through: :pending_memberships, source: :team
  has_many :approved_teams, through: :approved_memberships, source: :team
  
  
  validates :name, :battle_tag, presence: true
  
  def set_default_role
    self.role ||= :registered
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  def teams_id_list
    self.approved_memberships.pluck(:team_id)
  end
  
  def owned_teams_id_list
    self.owner_membership.pluck(:team_id)
  end
  
  def display_name
    self.name
  end
  
  def to_label
    self.name
  end
end
