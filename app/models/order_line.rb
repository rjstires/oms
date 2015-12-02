class OrderLine < ActiveRecord::Base
  include Filterable

  # DEFAULT SCOPE


  # MODEL SCOPES
  scope :index_join, -> {
    include_product
    .include_character
    .include_team
    .include_customer
    .include_region
    .include_faction
    }

  scope :lead,-> {
    where_order_not_paid
    .where_team_not_paid
    .where_not_scheduled
    .where_not_completed
    }

  scope :ready_to_schedule,-> {
    where_order_paid
    .where_team_not_paid
    .where_not_scheduled
    .where_not_completed
    }

  scope :scheduled,-> {
    where_order_paid
    .where_scheduled
    .where_not_completed
    }

  scope :completed_pending_team_payment,-> {
    where_order_paid
    .where_team_not_paid
    .where_scheduled
    .where_not_scheduled
    }

  scope :completed_order,-> {
    where_order_paid
    .where_team_not_paid
    .where_scheduled
    .where_scheduled
    }

  # Include scopes
  scope :include_product,-> { includes(:product => [
    :category,
    :difficulty,
    :zone,
    :play_style,
    :loot_option,
    :mount
    ])
    }

  scope :include_character,-> { includes(:character => [
    :armor_type,
    :classification,
    :primary_stat,
    :tier_token
    ])
    }

  scope :include_team ,-> { includes(:team) }
  scope :include_customer ,-> { includes(:customer) }
  scope :include_region ,-> { includes(:region) }
  scope :include_faction ,-> { includes(:faction) }

  # Math scopts
  scope :sale_total, -> { select('order_lines.*, SUM(order_lines.sale) as sale_sum') }
  scope :sale_average, -> { select('AVG(order_lines.sale) as sale_average') }
  scope :sale_count, -> { select('COUNT(order_lines.sale) as sale_count') }

  # Sorting Scopes
  scope :scheduled_at_asc, -> { order(scheduled_at: :asc) }
  scope :scheduled_at_desc, -> { order(scheduled_at: :desc) }

  scope :completed_at_asc, -> { order(completed_at: :asc) }
  scope :completed_at_desc, -> { order(completed_at: :desc) }

  scope :created_at_asc, -> { order(created_at: :asc) }
  scope :created_at_desc, -> { order(created_at: :desc) }


  # Filtering
  scope :by_team, -> (team) { where(team: team) }
  scope :category, -> (id) { joins(:product).where(:products => {:category_id => id}) }

  scope :where_completed, -> { where.not(completed_at: nil) }
  scope :where_not_completed, -> { where(completed_at: nil) }

  scope :where_scheduled, -> { where.not(scheduled_at: nil) }
  scope :where_not_scheduled, -> { where(scheduled_at: nil) }

  scope :where_order_paid, -> { where(order_paid: true) }
  scope :where_order_not_paid, -> { where(order_paid: false) }

  scope :where_team_paid, -> { where(team_paid: true) }
  scope :where_team_not_paid, -> { where(team_paid: false) }

  scope :where_assigned_to_team, -> { where.not(team_id: nil) }
  scope :where_not_assigned_to_team, -> { where(team_id: nil) }

  scope :upcoming_event,-> { where('scheduled_at >= ?', Time.now) }
  scope :past_event,-> { where('scheduled_at < ?', Time.now) }

  # CONSTANTS

  # ATTRIBUTE MACROS

  # ASSOCIATION MACROS
  belongs_to :product
  belongs_to :team
  belongs_to :character
  belongs_to :customer
  belongs_to :region
  belongs_to :faction

  has_one :category, through: :product


  # VALIDATION MACROS
  validates_presence_of :product, :character, :customer,
  :sale, :merchant_fee, :site_fee,
  :contractor_payment, :faction_id,
  :region_id
  # CALLBACKS

  # OTHER MACROS

  # CLASS METHODS

  # INSTANCE METHODS
  def completed?
    self.completed_at.present?
  end

  def scheduled?
    self.scheduled_at.present?
  end

  def team_is_paid?
    self.team_paid
  end

  def dispatched?
    self.team.present? && self.completed_at.nil? && self.order_is_paid?
  end

  def order_is_paid?
    self.order_paid
  end

  def status

    if self.order_is_paid?
      if self.scheduled?
        if self.completed?
          "completed"
        else
          "scheduled"
        end
      else
        "pending scheduling"
      end
    else
      "lead"
    end
  end

  def complete_order
    self.update_attributes(
      completed_at: Time.now,
      team_paid: true
      )
  end
end
