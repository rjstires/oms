# Preview all emails at http://localhost:3000/rails/mailers/invite_mailer
class InviteMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/invite_mailer/new_user_invite
  def new_user_invite

    @invite = Invite.create(email: 'test@email.com', team: Team.first, sender: User.first )
    InviteMailer.new_user_invite(@invite)
  end

  def existing_user_invite
    @invite = Invite.create(email: 'test@email.com', team: Team.first, sender: User.first )
    InviteMailer.existing_user_invite(@invite)
  end

end
