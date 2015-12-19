class InviteMailer < BaseMandrillMailer
  def new_user_invite(invite)
    subject = "[Boosting Edge, LLC] You have been invited to join #{invite.team.display_name}"
    merge_vars = {
      "RECIPIENT_EMAIL" => invite.email,
      "SENDER_NAME" => invite.sender.name,
      "TEAM_NAME" => invite.team.display_name,
      "PATH" => new_user_registration_url(invite_token: invite.token),
    }

    body = mandrill_template("new_user_invite", merge_vars)
    send_mail(invite.email, subject, body)
  end

  def existing_user_invite(invite)
    subject = "[Boosting Edge, LLC] You have been added to #{invite.team.display_name}"
    merge_vars = {
      "RECIPIENT_EMAIL" => invite.email,
      "SENDER_NAME" => invite.sender.name,
      "TEAM_NAME" => invite.team.display_name,
      "PATH" => team_url(invite.team),
    }

    body = mandrill_template("existing_user_invite", merge_vars)
    send_mail(invite.email, subject, body)
  end

end
