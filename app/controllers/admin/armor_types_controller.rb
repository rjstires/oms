class Admin::ArmorTypesController < AdminController
  before_action :set_armor_type, only: [:show, :edit, :update, :destroy]

  def index
    @armor_types = ::ArmorType.all
  end

  def show
  end

  def new
    @armor_type = ::ArmorType.new
  end

  def edit
  end

  def create
    @armor_type = ::ArmorType.new(armor_type_params)

    respond_to do |format|
      if @armor_type.save
        format.html { redirect_to admin_armor_type_path(@armor_type), notice: 'Armor type was successfully created.' }
        format.json { render :show, status: :created, location: @armor_type }
      else
        format.html { render :new }
        format.json { render json: @armor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @armor_type.update(armor_type_params)
        format.html { redirect_to admin_armor_type_path(@armor_type), notice: 'Armor type was successfully updated.' }
        format.json { render :show, status: :ok, location: @armor_type }
      else
        format.html { render :edit }
        format.json { render json: @armor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @armor_type.destroy
    respond_to do |format|
      format.html { redirect_to admin_armor_types_url, notice: 'Armor type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_armor_type
      @armor_type = ::ArmorType.find(params[:id])
    end

    def armor_type_params
      params.require(:armor_type).permit(:name)
    end
end
