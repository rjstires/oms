class EventSlot < ActiveRecord::Base
  belongs_to :event
  belongs_to :character

  def character_display
    if self.character.present?
      self.character.display_name
    else
      "Vacant"
    end
  end
end
