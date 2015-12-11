class TeamsController < ApplicationController
  before_action :set_team, only: [
    :dashboard,
    :completed_orders,
    :show,
    :edit,
    :update,
    :destroy]

    def dashboard
      @orders_completed = @team.order_lines.where_completed
      @orders_completed_this_month = @team.order_lines.completed_between(Time.now.beginning_of_month, Time.now)
      @orders_scheduled = @team.order_lines.where_scheduled.where_not_completed
      @monthly_total = @orders_completed_this_month.sum(:contractor_payment)
      @lifetime_total = @orders_completed.sum(:contractor_payment)
    end

    def completed_orders
      @orders_completed = @team.order_lines.where_completed
    end

    def show
      @memberships = @team.memberships.all.order(owner: :desc, confirmed: :desc)
    end

    def new
      @team = Team.new
    end

    def edit
    end

    def create
      @team = Team.new(team_params)
      @team.team_status = TeamStatus.find_by(name: 'pending')

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
        format.html { redirect_to root_url, notice: 'Team was successfully destroyed.' }
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
        :payment_type_id,
        )
    end
  end
