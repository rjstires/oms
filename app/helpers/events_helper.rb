module EventsHelper

  def modal_description(e)
    ret = "<span class=\"event-modal-title\">Date:</span> #{e.date} <br>"
    ret += "<span class=\"event-modal-title\">Time:</span> #{e.display_start_time} - #{e.display_end_time} #{e.display_tmz} <br>"
    ret += "<span class=\"event-modal-title\">Team:</span> #{e.team.display_alias} <br>"
    ret += "<span class=\"event-modal-title\">Faction:</span> #{e.team.faction.display_name} <br>"
    ret
  end
end
