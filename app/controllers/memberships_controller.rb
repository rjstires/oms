class MembershipsController < ApplicationController
  load_and_authorize_resource
  before_action :set_membership, except: :index
  before_action :set_team, only: :index

  def index
    @memberships = @team.memberships.all.order(owner: :desc, confirmed: :desc)
  end

  def approve
    @membership.approve!
    redirect_to team_memberships_path(@membership.team), {team_id: @membership.team.id}
  end

  def decline
    @membership.destroy
    redirect_to team_memberships_path(@membership.team), {team_id: @membership.team.id}
  end

  def promote
    @membership.promote!
    redirect_to team_memberships_path(@membership.team), {team_id: @membership.team.id}
  end

  private
  def set_membership
    @membership = Membership.find(params[:id])
  end
  def set_team
    @team = Team.find(params[:team_id])
  end

  def membership_params
    params.require(:membership).permit(:user_id, :team_id, :confirmed, :owner)
  end
end
