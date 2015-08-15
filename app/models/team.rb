class Team < ActiveRecord::Base
  after_create do |t|
    Membership.create!(team: t, user: t.user, confirmed: true, owner: true)
  end

  attr_accessor(:user)

  belongs_to :region
  belongs_to :faction
  belongs_to :team_status
  belongs_to :payment_type

  has_many :memberships, dependent: :destroy

  has_one :owner_membership, -> { where owner: true}, class_name: 'Membership'
  has_many :pending_memberships, -> { where confirmed: false}, class_name: 'Membership'
  has_many :approved_memberships, -> { where confirmed: true}, class_name: 'Membership'

  has_one :owner, through: :owner_membership, source: :user
  has_many :pending_members, through: :pending_memberships, source: :user
  has_many :approved_members, through: :approved_memberships, source: :user

  has_many :order_lines
  has_many :categories,-> {distinct()}, through: :order_lines
  has_many :order_line_statuses, through: :order_lines


  validates :name, :name_alias, presence: true, uniqueness: true

  def display_name
    "#{self.name.titleize} (#{self.id})"
  end

  def name=(val)
    write_attribute(:name, val.downcase)
  end

  def name_alias=(val)
    write_attribute(:name_alias, val.downcase)
  end

  def realm=(val)
    write_attribute(:realm, val.downcase)
  end

  def payment_address=(val)
    write_attribute(:payment_address, val.downcase)
  end

  def self.importJSON(file)
    json = parseJSON file
    teams = json['teams']
    Team.delete_all
    teams.each do |row|
      row['name'].downcase!
      row['alias'].downcase!
      row['faction'].downcase!
      row['region'].downcase!
      row['realm'].downcase!
      row['address'].downcase!

      @team = Team.find_or_create_by!(name: row['name']) do |t|
        t.name_alias = row['alias']
        t.faction = Faction.find_or_create_by!(name: row['faction'])
        t.region = Region.find_or_create_by!(name: row['region'])
        t.realm = row['realm']
        t.payment_type = PaymentType.find_by(name: 'paypal')
        t.payment_address = row['address']
        t.team_status = TeamStatus.find_by(name: 'pending')
        t.user = User.find_by(email: 'jarvis.dresden@gmail.com')
      end
    end
  end

  def self.parseJSON(f)
    ActiveSupport::JSON.decode( File.read( f.path ) )
  end
end
