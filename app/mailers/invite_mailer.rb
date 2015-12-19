class InviteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.new_user_invite.subject
  #
  def new_user_invite(invite)
    @invite = invite

    mail to: @invite.email
    mail subject: "You have been invited to join {@invite.team.display_name}"
  end

  def existing_user_invite(invite)
    @invite = invite

    mail to: @invite.email
    mail subject: "You have been added to {@invite.team.display_name}"
  end
end
