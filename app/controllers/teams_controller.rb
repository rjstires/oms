class TeamsController < ApplicationController
  load_and_authorize_resource :except => [:index, :join]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.includes(:owner, :approved_members, :pending_members, :region, :faction, :team_status).all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    @team.user = current_user

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upload
    Team.importJSON( params[:file] )
    redirect_to teams_path
  end

  private

  def team_params
    params.require(:team).permit(:name,
      :name_alias,
      :realm,
      :region_id,
      :faction_id,
      :realm_id,
      :team_status_id,
      :payment_type_id,
      :payment_address)
  end
end
