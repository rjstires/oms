class Event < ActiveRecord::Base
  default_scope {
    order(event_timestamp: :asc)
  }

  belongs_to :team
  belongs_to :character
  belongs_to :category
  belongs_to :zone
  belongs_to :difficulty

  has_many :event_slots, dependent: :destroy

  validates :team, :category, :zone, :difficulty, presence: true

  scope :upcoming_events, -> { where('events.event_timestamp >= ?', Time.now) }

  def calendar_title
    "#{self.difficulty.display_name}: #{self.zone.display_name}"
  end

end
