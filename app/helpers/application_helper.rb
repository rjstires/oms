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

  def tile_color(color)
    accepted_colors = [
      'green',
      'red',
      'blue',
      'orange',
      'prusia',
      'lemon',
      'purple',
      'concrete'
    ]

    accepted_colors.include?(color) ? color : 'concrete'

  end

  def render_clean_tile(options={})
    render partial: "shared/clean_tile", locals: {
      title: options.fetch(:title),
      number: options.fetch(:number),
      icon: options.fetch(:icon),
      path: options.fetch(:path, nil),
      path_title: options.fetch(:path_title, nil),
      color: options.fetch(:color, "concrete")
    }
  end

  def render_clean_tile_details(path=nil, path_title=nil)
    unless path.nil?
      path_title ||= 'details'
      link_to path, class: 'details' do
        "&nbsp;<span>#{path_title} <i class=\"fa fa-arrow-circle-right pull-right\"></i></span>".html_safe
      end
    end
  end

  def render_header_tile(options={})

    render partial: "shared/header_tile", locals: {
      display_header: options.fetch(:header),
      display_text: options.fetch(:text, '&nbsp;'.html_safe),
      display_number: options.fetch(:number, nil),
      color: options.fetch(:color, "concrete")
    }
  end

end
