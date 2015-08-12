class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # safe url parameters to use instead of params.merge

  def safe_params unsafe = {}
    params.merge(unsafe).merge(only_path: true)
  end

  helper_method :safe_params

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name, :email, :battle_tag, :skype) }
    devise_parameter_sanitizer.for(:account_update ) { |u| u.permit(:name, :email, :battle_tag, :skype) }
  end

  private
    def is_admin?
      current_user.admin?
    end
end
