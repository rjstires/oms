# Preview all emails at http://localhost:3000/rails/mailers/invite_mailer
class InviteMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/invite_mailer/existing_user_invite
  def existing_user_invite
    InviteMailer.existing_user_invite
  end

  # Preview this email at http://localhost:3000/rails/mailers/invite_mailer/new_user_invite
  def new_user_invite
    InviteMailer.new_user_invite
  end

end
