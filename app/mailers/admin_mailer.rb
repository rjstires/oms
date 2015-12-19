class AdminMailer < BaseMandrillMailer

  def new_registration(user)
    subject = "[Boosting Edge, LLC] New user notification."
    merge_vars = {
      "USER_NAME" => user.email,
      "USER_EMAIL" => user.name,
      "PATH" => admin_user_path(user),
    }

    body = mandrill_template("new_user_invite", merge_vars)
    send_mail(user.email, subject, body)
  end
end
