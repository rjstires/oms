class User < ActiveRecord::Base
  enum role: [:registered, :approved, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  has_many :owned_teams, :class_name => 'Team'
  
  has_many :memberships
  has_many :teams, through: :memberships
 
  def set_default_role
    self.role ||= :approved
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  def team_ids
    self.teams.pluck(:id)
  end
  
  def to_label
    self.name
  end
end
