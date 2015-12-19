class User::RegistrationsController < Devise::RegistrationsController
  before_action :update_sanitized_params

  def new
    @token = params[:invite_token]
    super
  end

  def create
    super
    @token = params[:invite_token]
    if @user.persisted?
      AdminMailer.new_registration(@user).deliver

      if @token != nil
       team =  Invite.find_by_token(@token).team
       team.approved_memberships.create(user: @user)
     end
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
