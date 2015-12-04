class Event < ActiveRecord::Base
  default_scope {
    includes(:team, :character, :category, :zone, :difficulty, :event_slots)
    .order(event_timestamp: :asc)
    .upcoming_events
  }

  belongs_to :team
  belongs_to :character
  belongs_to :category
  belongs_to :zone
  belongs_to :difficulty

  has_many :event_slots, dependent: :destory

  validates :team, :character, :category, :zone, :difficulty, presence: true

  scope :upcoming_events, -> { where('? > ?', :cutoff_timestamp, DateTime.now) }

end
