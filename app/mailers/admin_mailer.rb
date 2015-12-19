class AdminMailer < ApplicationMailer
  default from: 'Administrator <noreply@boostingedge.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.new_registration.subject
  #
  def new_registration(user)
    @user = user
    mail to: User.admin.pluck(:email)
    mail subject: "A new user has registered with Boosting Edge, LLC"
  end
end
