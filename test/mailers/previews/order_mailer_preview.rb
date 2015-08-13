# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview aat http://localhost:3000/rails/mailers/order_mailer/confirmation_email
  def confirmation_email
    order_line = OrderLine.order(:completed_at).last.id
    OrderMailer.confirmation_email(order_line)
  end
end