module OrderLinesHelper
  def date_column_header
    case params[:status]
    when 'completed'
      title = 'Completed On'
    when 'scheduled'
      title = 'Scheduled For'
    when 'paid'
      title = 'Created On'
    when 'lead'
      title = 'Created On'
    end

    "<th>#{title}</th>".html_safe unless title.nil?
  end

  def date_value(order)
    case params[:status]
    when 'completed'
      date = order.completed_at
    when 'scheduled'
      date = order.scheduled_at
    when 'paid'
      date = order.created_at
    when 'lead'
      date = order.created_at
    end

    "<td>#{date.to_s(:scheduled_for)}</td>".html_safe unless date.nil?
  end

  def status_link_text(o)
    "#{o.name.titleize} <span class=\"badge\"></span>".html_safe
  end
end
