module EventsHelper
	
	def event_row_class(event)
		event.team.faction.name.parameterize
	end

	def event_slot_row_class(slot)
		slot.character.present? ? "not-vacant" : "vacant"
	end

end
