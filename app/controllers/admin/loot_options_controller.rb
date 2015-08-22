class Admin::LootOptionsController < AdminController
  before_action :set_loot_option, only: [:show, :edit, :update, :destroy]

  def index
    @loot_options = ::LootOption.all
  end

  def show
  end

  def new
    @loot_option = ::LootOption.new
  end

  def edit
  end

  def create
    @loot_option = ::LootOption.new(loot_option_params)

    respond_to do |format|
      if @loot_option.save
        format.html { redirect_to admin_loot_option_path(@loot_option), notice: 'Loot option was successfully created.' }
        format.json { render :show, status: :created, location: @loot_option }
      else
        format.html { render :new }
        format.json { render json: @loot_option.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @loot_option.update(loot_option_params)
        format.html { redirect_to admin_loot_option_path(@loot_option), notice: 'Loot option was successfully updated.' }
        format.json { render :show, status: :ok, location: @loot_option }
      else
        format.html { render :edit }
        format.json { render json: @loot_option.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @loot_option.destroy
    respond_to do |format|
      format.html { redirect_to admin_loot_options_url, notice: 'Loot option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_loot_option
      @loot_option = ::LootOption.find(params[:id])
    end

    def loot_option_params
      params.require(:loot_option).permit(:name)
    end
end
