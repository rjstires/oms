class EventSlot < ActiveRecord::Base
  default_scope { includes(:character) }
  belongs_to :event
  belongs_to :character
  validates :title, :event, :character, presence: true

  def character_display
    if self.character.present?
      "Attending: #{self.character.display_name}"
    else
      "Vacant"
    end
  end
end
