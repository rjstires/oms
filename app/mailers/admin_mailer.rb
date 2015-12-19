class AdminMailer < BaseMandrillMailer

  def new_registration(user)
    subject = "New user notification."

    to = User.admin.pluck(:email)

    merge_vars = {
      "USER_EMAIL" => user.email,
      "USER_NAME" => user.name,
      "PATH" => admin_user_path(user),
    }

    body = mandrill_template("admin_new_user", merge_vars)
    send_mail(to, subject, body)
  end
end
