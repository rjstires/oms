class Admin::UsersController < AdminController
  before_action :all_users, only: [:index, :create, :update, :destroy]
  before_action :set_user, only: [:edit, :update, :destroy]
  respond_to :html, :js

  def index
    @user = User.new
  end

  def new
    @user = ::User.new
  end

  def edit
  end

  def create
    @user = ::User.create(user_params)
  end

  def update
    @user.update_attributes(user_params)
  end

  def destroy
    @user.destroy
  end

  private
  def set_user
    @user = ::User.find(params[:id])
  end

  def all_users
    @users = ::User.order(name: :asc).all
  end

  def user_params
    params.require(:user).permit(:name, :email, :role, :skype, :battle_tag, :password, :password_confirmation)
  end
end
