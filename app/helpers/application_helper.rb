module ApplicationHelper

	def status_link_text(o)
		"#{o.name.titleize} <span class=\"badge\"></span>".html_safe
	end
end
