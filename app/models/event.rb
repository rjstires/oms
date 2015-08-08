class Event < ActiveRecord::Base
  belongs_to :team, inverse_of: :events
  
  scope :by_team,->(team) {where(team: team)}
end
