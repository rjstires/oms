class Admin::MountsController < AdminController
  before_action :set_mount, only: [:show, :edit, :update, :destroy]

  def index
    @mounts = ::Mount.all
  end

  def show
  end

  def new
    @mount = ::Mount.new
  end

  def edit
  end

  def create
    @mount = ::Mount.new(mount_params)

    respond_to do |format|
      if @mount.save
        format.html { redirect_to admin_mount_path(@mount), notice: 'Mount was successfully created.' }
        format.json { render :show, status: :created, location: @mount }
      else
        format.html { render :new }
        format.json { render json: @mount.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mount.update(mount_params)
        format.html { redirect_to admin_mount_path(@mount), notice: 'Mount was successfully updated.' }
        format.json { render :show, status: :ok, location: @mount }
      else
        format.html { render :edit }
        format.json { render json: @mount.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mount.destroy
    respond_to do |format|
      format.html { redirect_to admin_mounts_url, notice: 'Mount was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_mount
      @mount = ::Mount.find(params[:id])
    end

    def mount_params
      params.require(:mount).permit(:name)
    end
end
