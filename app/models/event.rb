class Event < ActiveRecord::Base
  belongs_to :team
  belongs_to :character

  def display_character
    if self.character.present?
      self.character.display_name
    else
      "Vacant"
    end
  end
end
