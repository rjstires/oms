module OrderLinesHelper

  def status_link_text(o)
    "#{o.name.titleize} <span class=\"badge\"></span>".html_safe
  end

  def faction_sprite(faction)

    formatted_name = faction.name.strip.parameterize

    string = ""
    string += " <i"
    string += " data-toggle=\"tooltip\""
    string += " data-placement=\"top\""
    string += " title=\"#{faction.display_name}\""
    string += " class=\"characters-sprite characters-sprite-#{formatted_name}\">"
    string += " </i>"
    string.html_safe
  end

  def character_sprite(character)
    string = ""
    string += " <i"
    string += " data-toggle=\"tooltip\""
    string += " data-placement=\"top\""
    string += " title=\"#{character.classification.display_name}\""
    string += " class=\"characters-sprite characters-sprite-#{character.classification.css_name}\">"
    string += " </i>"
    string += " <i"
    string += " data-toggle=\"tooltip\""
    string += " data-placement=\"top\""
    string += " title=\"#{character.spec.titleize}\""
    string += " class=\"characters-sprite characters-sprite-#{character.css_name_with_spec}\">"
    string += " </i>"
    string.html_safe
  end

  def order_date_display(order_line)
    date = ''
    if !order_line.scheduled_at.blank?
        date = order_line.scheduled_at
    elsif !order_line.completed_at.blank?
        date = order_line.completed_at
    else
        date = order_line.created_at
    end

    date.to_s(:order_line)
  end

end


