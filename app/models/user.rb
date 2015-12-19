class User < ActiveRecord::Base
  enum role: [:registered, :approved, :admin]

  after_initialize :set_default_role, :if => :new_record?

  has_many :memberships, dependent: :destroy

  has_many :owned_teams, :class_name => 'Team'
  has_many :owner_membership, -> { where owner: true}, class_name: 'Membership'
  has_many :pending_memberships, -> { where confirmed: false}, class_name: 'Membership'
  has_many :approved_memberships, -> { where confirmed: true}, class_name: 'Membership'

  has_many :owned_teams, through: :owner_membership, source: :team
  has_many :pending_teams, through: :pending_memberships, source: :team
  has_many :approved_teams, through: :approved_memberships, source: :team

  has_many :invitations, :class_name => "Invite", :foreign_key => 'recipient_id'
  has_many :sent_invites, :class_name => "Invite", :foreign_key => 'sender_id'

  validates :name, :battle_tag, presence: true
  validates_uniqueness_of :battle_tag, message: "%{value} already exists."
  validates_uniqueness_of :skype, :allow_blank => true, message: "%{value} already exists."

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
    self.name.titleize
  end

  def to_label
    self.email
  end

  def self.importJSON(file)
    json = parseJSON file
    members = json['members']

    members.each do |row|
      row['email'].downcase!
      row['username'].downcase!
      row['battletag'].downcase!
      row['skype'].downcase!
      row['team'].downcase!

      @user = User.find_or_create_by!(email: row['email']) do |customer|
        customer.name = row['username']
        customer.battle_tag = row['battletag']
        customer.skype = row['skype']
        customer.password = 'password'
      end
      @user.confirm!

      @team = Team.find_by(name_alias: row['team'].downcase);

      Membership.where(team: @team).find_or_create_by!(user: @user) do |m|
        m.confirmed = true
      end

    end
  end

  def self.parseJSON(f)
    ActiveSupport::JSON.decode( File.read( f.path ) )
  end
end
