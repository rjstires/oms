class TeamStatusesController < ApplicationController
  before_action :set_team_status, only: [:show, :edit, :update, :destroy]

  # GET /team_statuses
  # GET /team_statuses.json
  def index
    @team_statuses = TeamStatus.all
  end

  # GET /team_statuses/1
  # GET /team_statuses/1.json
  def show
  end

  # GET /team_statuses/new
  def new
    @team_status = TeamStatus.new
  end

  # GET /team_statuses/1/edit
  def edit
  end

  # POST /team_statuses
  # POST /team_statuses.json
  def create
    @team_status = TeamStatus.new(team_status_params)

    respond_to do |format|
      if @team_status.save
        format.html { redirect_to @team_status, notice: 'Team status was successfully created.' }
        format.json { render :show, status: :created, location: @team_status }
      else
        format.html { render :new }
        format.json { render json: @team_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_statuses/1
  # PATCH/PUT /team_statuses/1.json
  def update
    respond_to do |format|
      if @team_status.update(team_status_params)
        format.html { redirect_to @team_status, notice: 'Team status was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_status }
      else
        format.html { render :edit }
        format.json { render json: @team_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_statuses/1
  # DELETE /team_statuses/1.json
  def destroy
    @team_status.destroy
    respond_to do |format|
      format.html { redirect_to team_statuses_url, notice: 'Team status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_status
      @team_status = TeamStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_status_params
      params.require(:team_status).permit(:name)
    end
end
