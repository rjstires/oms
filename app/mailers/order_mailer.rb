class OrderMailer < BaseMandrillMailer

  def scheduling_confirmation(order_line_id)
    @order_line = OrderLine
    .joins(
      :customer,
      :character,
      :product,
      character: [:armor_type, :classification, :primary_stat, :tier_token],
      product: [:category, :difficulty, :zone, :play_style, :loot_option],
      team: [:approved_members, :region, :faction]
      )
    .find(order_line_id)

    @customer_email = @order_line.customer.email
    @team_email_list = @order_line.team.approved_members.pluck(:email)

    @email_list = []
    @email_list << @customer_email
    @email_list << @team_email_list

    @content_title = ""
    @content_title = "#{@content_title} #{@order_line.product.difficulty.display_name} " unless @order_line.product.difficulty.display_name == ""
    @content_title = @content_title + @order_line.product.category.display_name unless @order_line.product.category.display_name == ""

    @subject =  "[BoostingEdge.com] #{@content_title} Scheduling Confirmation (##{@order_line.order})"
    mail(to: @email_list, subject: @subject)
  end

  def order_complete(order)
    subject = "Order #{order.order} has been completed."

    to = order.customer.email

    merge_vars = {
      "ORDER_NUMBER" => order.order
    }

    body = mandrill_template("order_complete", merge_vars)
    send_mail(to, subject, body)
  end

end
