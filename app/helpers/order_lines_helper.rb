module OrderLinesHelper

  def status_link_text(o)
    "#{o.name.titleize} <span class=\"badge\"></span>".html_safe
  end

  def faction_sprite(order_line)
    string = ""
    string += " <i"
    string += " data-toggle=\"tooltip\""
    string += " data-placement=\"top\""
    string += " title=\"#{order_line.faction.display_name}\""
    string += " class=\"banner-sprite banner-sprite-banner_#{order_line.faction.name}\">"
    string += " </i>"
    string.html_safe
  end

  def character_sprite(order_line)
    string = ""
    string += " <i"
    string += " data-toggle=\"tooltip\""
    string += " data-placement=\"top\""
    string += " title=\"#{order_line.character.classification.display_name}\""
    string += " class=\"class-sprite class-sprite-#{order_line.character.classification.css_name}\">"
    string += " </i>"
    string += " <i"
    string += " data-toggle=\"tooltip\""
    string += " data-placement=\"top\""
    string += " title=\"#{order_line.character.spec.titleize}\""
    string += " class=\"class-sprite class-sprite-#{order_line.character.css_name_with_spec}\">"
    string += " </i>"
    string.html_safe
  end
end

