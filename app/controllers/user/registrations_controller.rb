class User::RegistrationsController < Devise::RegistrationsController
  before_action :update_sanitized_params

  protected

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :battle_tag, :skype)}
  end
end