class User::RegistrationsController < Devise::RegistrationsController
  before_action :update_sanitized_params

  def create
    super
    if @user.persisted?
      AdminMailer.new_registration(@user).deliver
    end
  end

  protected

  def update_sanitized_params
   devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(
    :name,
    :email,
    :battle_tag,
    :skype,
    :password,
    :password_confirmation
    )}
 end

 private

 def after_inactive_sign_up_path_for(resource)
  new_user_session_path
end
end
