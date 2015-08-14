class PrimaryStatsController < ApplicationController
  before_action :set_primary_stat, only: [:show, :edit, :update, :destroy]

  # GET /primary_stats
  # GET /primary_stats.json
  def index
    @primary_stats = PrimaryStat.all
  end

  # GET /primary_stats/1
  # GET /primary_stats/1.json
  def show
  end

  # GET /primary_stats/new
  def new
    @primary_stat = PrimaryStat.new
  end

  # GET /primary_stats/1/edit
  def edit
  end

  # POST /primary_stats
  # POST /primary_stats.json
  def create
    @primary_stat = PrimaryStat.new(primary_stat_params)

    respond_to do |format|
      if @primary_stat.save
        format.html { redirect_to @primary_stat, notice: 'Primary stat was successfully created.' }
        format.json { render :show, status: :created, location: @primary_stat }
      else
        format.html { render :new }
        format.json { render json: @primary_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /primary_stats/1
  # PATCH/PUT /primary_stats/1.json
  def update
    respond_to do |format|
      if @primary_stat.update(primary_stat_params)
        format.html { redirect_to @primary_stat, notice: 'Primary stat was successfully updated.' }
        format.json { render :show, status: :ok, location: @primary_stat }
      else
        format.html { render :edit }
        format.json { render json: @primary_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /primary_stats/1
  # DELETE /primary_stats/1.json
  def destroy
    @primary_stat.destroy
    respond_to do |format|
      format.html { redirect_to primary_stats_url, notice: 'Primary stat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_primary_stat
      @primary_stat = PrimaryStat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def primary_stat_params
      params.require(:primary_stat).permit(:name)
    end
end
