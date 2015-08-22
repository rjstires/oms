class Admin::MembershipsController < AdminController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  def index
    @memberships = ::Membership.all
  end

  def show
  end

  def new
    @membership = ::Membership.new
  end

  def edit
  end

  def create
    @membership = ::Membership.new(membership_params)

    respond_to do |format|
      if @membership.save
        format.html { redirect_to admin_membership_path(@membership), notice: 'Membership was successfully created.' }
        format.json { render :show, status: :created, location: @membership }
      else
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to admin_membership_path(@membership), notice: 'Membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render :edit }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to admin_memberships_url, notice: 'Membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_membership
      @membership = ::Membership.find(params[:id])
    end

    def membership_params
      params.require(:membership).permit(:user_id, :team_id, :confirmed, :owner)
    end
end
