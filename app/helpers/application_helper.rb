module ApplicationHelper

	def status_link_text(o)
		"#{o.name.titleize} <span class=\"badge\"></span>".html_safe
	end

  def sub_nav_link(title, path, icon=nil)
    icon = "<i class=\"fa fa-#{icon}\"></i>" if icon.present?
    content_tag :li, class: 'sub-nav' do
      link_to path do
        "#{icon} #{title}".html_safe
      end
    end
  end

end
