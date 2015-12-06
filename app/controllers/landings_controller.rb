class LandingsController < ApplicationController
  before_action :authenticate_user!

  def index
      path = 'dashboard'
      path = 'admin_root' if current_user.admin?

      redirect_to path.to_sym
  end
end
