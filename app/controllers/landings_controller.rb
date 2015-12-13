class LandingsController < ApplicationController
  before_action :authenticate_user!

  def index
    path = dashboard_path.to_s
    path = dashboard_team_path(current_user.teams_id_list.first).to_s if current_user.teams_id_list.any?
    path = admin_root_path.to_s if current_user.admin?

    redirect_to path
  end
end
