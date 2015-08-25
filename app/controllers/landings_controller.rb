class LandingsController < ApplicationController
  before_action :authenticate_user!
  before_action :route_on_user_status

  def index
  end

  private

    def route_on_user_status
      redirect_to admin_path if current_user.admin?
      redirect_to
    end
end