class MembershipsController < ApplicationController
  before_action :all_memberships, only: [:update]
  load_and_authorize_resource

  def update
    @membership = Membership.find(params[:id])
    
    if @membership.confirmed?
      @membership.update_attributes(membership_params)
    else
      if params[:membership][:confirmed] == 'true'
        @membership.update_attributes(membership_params)
      else
        @membership.destroy!
      end
    end
  end

    private
    def all_memberships
      @team = Membership.find(params[:id]).team
      @approved_memberships = @team.approved_memberships.all
      @pending_memberships = @team.pending_memberships.all
    end

  def membership_params
    params.require(:membership).permit(:user_id, :team_id, :confirmed, :owner)
  end
end
