class MembershipsController < ApplicationController
  load_and_authorize_resource :team, :only => [:index]
  load_and_authorize_resource :membership, :through => :team, :only => [:index]
  before_filter :check_existing, :only => :create

  # GET /memberships
  # GET /memberships.json
  def index
    @memberships = @team.memberships.all
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
  end

  # GET /memberships/new
  def new
    @team = Team.find(params[:team_id])
    @membership = Membership.new(team: @team, user: current_user)

    respond_to do |format|
      if @membership.save
        format.html { redirect_to teams_path, notice: 'Membership request was successfully sent.' }
        format.json { render :show, status: :created, location: @membership }
        # Send email here.
      else
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /memberships/1/edit
  def edit
  end

  # POST /memberships
  # POST /memberships.json
  def create
    @membership = Membership.new(membership_params)

    respond_to do |format|
      if @membership.save
        format.html {
          flash[:notice] = 'Membership was successfully created'
          redirect_back_or(root_path)
          }
        format.json { render :show, status: :created, location: @membership }
      else
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to team_membership_path(@team, @membership), notice: 'Membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render :edit }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to team_memberships_path(@team), notice: 'Membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_existing
    team = params[:membership][:team_id]
    user = params[:membership][:user_id]
    @membership = Membership.find_by(team_id: team, user_id: user)
    unless @membership.nil?
      flash[:warning] = "That membership already exists."
      redirect_back_or root_url
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_params
      params.require(:membership).permit(:user_id, :team_id, :confirmed, :owner)
    end
end
