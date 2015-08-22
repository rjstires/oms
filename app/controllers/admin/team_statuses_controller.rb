class Admin::TeamStatusesController < AdminController
  before_action :set_team_status, only: [:show, :edit, :update, :destroy]

  def index
    @team_statuses = ::TeamStatus.all
  end

  def show
  end

  def new
    @team_status = ::TeamStatus.new
  end

  def edit
  end

  def create
    @team_status = ::TeamStatus.new(team_status_params)

    respond_to do |format|
      if @team_status.save
        format.html { redirect_to admin_team_status_path(@team_status), notice: 'TeamStatus was successfully created.' }
        format.json { render :show, status: :created, location: @team_status }
      else
        format.html { render :new }
        format.json { render json: @team_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @team_status.update(team_status_params)
        format.html { redirect_to admin_team_status_path(@team_status), notice: 'TeamStatus was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_status }
      else
        format.html { render :edit }
        format.json { render json: @team_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @team_status.destroy
    respond_to do |format|
      format.html { redirect_to admin_team_statuses_url, notice: 'TeamStatus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_team_status
      @team_status = ::TeamStatus.find(params[:id])
    end

    def team_status_params
      params.require(:team_status).permit(:name)
    end
end
