class Membership < ActiveRecord::Base
  validates :user, uniqueness: {scope: :team}

  belongs_to :user
  belongs_to :team

  validates :user, :team, presence: true

  scope :by_user, -> (user) { where(user: user) }
  scope :by_team, -> (team) { where(team: team) }
  scope :confirmed, -> { where confirmed: true }
  scope :unconfirmed, -> { where confirmed: false }

  scope :owner, -> { where owner: true }

  def approve!
    self.update(confirmed: true, owner: false)
  end

  def decline!
    self.destroy
  end

  def promote!
    Membership.where(:team_id => self.team).update_all(:owner => false)
    self.update(confirmed: true, owner: true)
  end

  def owner?
    self.owner
  end

  def confirmed?
    self.confirmed
  end

  def status
    if owner? && confirmed?
      :owner
    elsif !owner? && confirmed?
      :member
    elsif !owner? && !confirmed?
      :pending
    else
      :unprocessable
    end
  end

end
