class Admin::RegionsController < AdminController
  before_action :set_region, only: [:show, :edit, :update, :destroy]

  def index
    @regions = ::Region.all
  end

  def show
  end

  def new
    @region = ::Region.new
  end

  def edit
  end

  def create
    @region = ::Region.new(region_params)

    respond_to do |format|
      if @region.save
        format.html { redirect_to admin_region_path(@region), notice: 'Region was successfully created.' }
        format.json { render :show, status: :created, location: @region }
      else
        format.html { render :new }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @region.update(region_params)
        format.html { redirect_to admin_region_path(@region), notice: 'Region was successfully updated.' }
        format.json { render :show, status: :ok, location: @region }
      else
        format.html { render :edit }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @region.destroy
    respond_to do |format|
      format.html { redirect_to admin_regions_url, notice: 'Region was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_region
      @region = ::Region.find(params[:id])
    end

    def region_params
      params.require(:region).permit(:name)
    end
end
