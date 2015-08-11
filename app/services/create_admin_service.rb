class CreateAdminService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
      user.password = Rails.application.secrets.admin_password
      user.password_confirmation = Rails.application.secrets.admin_password
      user.name = Rails.application.secrets.admin_name
      user.battle_tag = Rails.application.secrets.admin_battle_tag
      user.skype =Rails.application.secrets.admin_skype
      user.confirm!
      user.admin!
      end
  end
end
