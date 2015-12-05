module ApplicationHelper

	def status_link_text(o)
		"#{o.name.titleize} <span class=\"badge\"></span>".html_safe
	end

  def nav_link(title, path, options = {})
    klass = options.fetch(:klass, '')
    icon = options.fetch(:icon, nil)

    icon_string = "<i class=\"fa fa-#{icon}\"></i>".html_safe if icon.present?

    content_tag :li, class: klass do
      link_to path do
        "#{icon_string}<span>#{title}</span>".html_safe
      end
    end
  end

end
