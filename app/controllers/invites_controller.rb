class InvitesController < ApplicationController
  before_action :set_team



  def new
    @invite = @team.invites.new
  end


def create
  @invite = @team.invites.new(invite_params)
  @invite.sender_id = current_user.id

  if @invite.save

    #if the user already exists
    if @invite.recipient != nil

       #send a notification email
       InviteMailer.existing_user_invite(@invite).deliver

       #Add the user to the user group
       @team.approved_memberships.create(user: @invite.recipient)
      redirect_to team_path(@team), notice: 'User has been added to your team.'
    else
       InviteMailer.new_user_invite(@invite).deliver
        redirect_to team_path(@team), notice: 'An invitation has been sent.'
    end

  else
    @invite.errors.full_messages.each { |msg| flash[:alert] = msg }
    redirect_to team_path(@team)
  end

end

  private

  def invite_params
    params.require(:invite).permit(:email)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end

end
