class EventSlot < ActiveRecord::Base
  default_scope { includes(:character) }
  belongs_to :event
  belongs_to :character

  validates :title, :event, presence: true

  scope :upcoming_vacancies,->{
    includes(:character, :event => [
      :category,
      :difficulty,
      :zone,
      :team => [:faction],
      ])
    .where('events.event_timestamp >= ?', Time.now)
    .where(character: nil)
    .order('events.event_timestamp ASC')
    .limit(5)
  }

  def character_display
    if self.character.present?
      "Attending: #{self.character.display_name}"
    else
      "Vacant"
    end
  end
end
