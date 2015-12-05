class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def show
    @approved_memberships = @team.approved_memberships.all
    @pending_memberships = @team.pending_memberships.all

    @orders_completed = @team.order_lines.where_completed
    @orders_completed_this_month = @team.order_lines.completed_between(Time.now.beginning_of_month, Time.now)

    @orders_scheduled = @team.order_lines.where_scheduled.where_not_completed


    @monthly_total = @orders_completed_this_month.sum(:contractor_payment)
    @lifetime_total = @orders_completed.sum(:contractor_payment)
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save

        Membership.create!(
          team: @team,
          user: current_user,
          confirmed: true,
          owner: true
        )

        format.html { redirect_to team_path(@team), notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to team_path(@team), notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

  def team_params
    params.require(:team).permit(
    :name,
    :name_alias,
    :region,
    :realm,
    :payment_address,
    :faction_id,
    :region_id,
    :team_status_id,
    :payment_type_id,
    )
  end
end
