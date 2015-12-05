module ApplicationHelper

	def status_link_text(o)
		"#{o.name.titleize} <span class=\"badge\"></span>".html_safe
	end

  def nav_link(title, path, klass=nil, icon=nil)
    icon = "<i class=\"fa fa-#{icon}\"></i>" if icon.present?
    content_tag :li, class: klass do
      link_to path do
        "#{icon}<span>#{title}</span>".html_safe
      end
    end
  end


end
