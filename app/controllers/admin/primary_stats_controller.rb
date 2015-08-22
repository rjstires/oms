class Admin::PrimaryStatsController < AdminController
  before_action :set_primary_stat, only: [:show, :edit, :update, :destroy]

  def index
    @primary_stats = ::PrimaryStat.all
  end

  def show
  end

  def new
    @primary_stat = ::PrimaryStat.new
  end

  def edit
  end

  def create
    @primary_stat = ::PrimaryStat.new(primary_stat_params)

    respond_to do |format|
      if @primary_stat.save
        format.html { redirect_to admin_primary_stat_path(@primary_stat), notice: 'Primary stat was successfully created.' }
        format.json { render :show, status: :created, location: @primary_stat }
      else
        format.html { render :new }
        format.json { render json: @primary_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @primary_stat.update(primary_stat_params)
        format.html { redirect_to admin_primary_statspath(@primary_stat), notice: 'Primary stat was successfully updated.' }
        format.json { render :show, status: :ok, location: @primary_stat }
      else
        format.html { render :edit }
        format.json { render json: @primary_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @primary_stat.destroy
    respond_to do |format|
      format.html { redirect_to admin_primary_stats_url, notice: 'Primary stat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_primary_stat
      @primary_stat = ::PrimaryStat.find(params[:id])
    end

    def primary_stat_params
      params.require(:primary_stat).permit(:name)
    end
end
