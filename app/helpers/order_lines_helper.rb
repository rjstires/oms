module OrderLinesHelper
  def date_column_header
    case params[:status]
    when 4
      title = 'Completed On'
    when 1
      title = 'Scheduled For'
    when 2
      title = 'Created On'
    when 3
      title = 'Created On'
    end

    "<th>#{title}</th>".html_safe unless title.nil?
  end

  def date_value(order)
    case params[:status]
    when 4
      date = order.completed_at
    when 1
      date = order.scheduled_at
    when 2
      date = order.created_at
    when 3
      date = order.created_at
    end

    "<td>#{date.to_s(:scheduled_for)}</td>".html_safe unless date.nil?
  end

  def status_link_text(o)
    "#{o.name.titleize} <span class=\"badge\"></span>".html_safe
  end
end
