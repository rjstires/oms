class LootOptionsController < ApplicationController
  before_action :set_loot_option, only: [:show, :edit, :update, :destroy]

  # GET /loot_options
  # GET /loot_options.json
  def index
    @loot_options = LootOption.all
  end

  # GET /loot_options/1
  # GET /loot_options/1.json
  def show
  end

  # GET /loot_options/new
  def new
    @loot_option = LootOption.new
  end

  # GET /loot_options/1/edit
  def edit
  end

  # POST /loot_options
  # POST /loot_options.json
  def create
    @loot_option = LootOption.new(loot_option_params)

    respond_to do |format|
      if @loot_option.save
        format.html { redirect_to @loot_option, notice: 'Loot option was successfully created.' }
        format.json { render :show, status: :created, location: @loot_option }
      else
        format.html { render :new }
        format.json { render json: @loot_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loot_options/1
  # PATCH/PUT /loot_options/1.json
  def update
    respond_to do |format|
      if @loot_option.update(loot_option_params)
        format.html { redirect_to @loot_option, notice: 'Loot option was successfully updated.' }
        format.json { render :show, status: :ok, location: @loot_option }
      else
        format.html { render :edit }
        format.json { render json: @loot_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loot_options/1
  # DELETE /loot_options/1.json
  def destroy
    @loot_option.destroy
    respond_to do |format|
      format.html { redirect_to loot_options_url, notice: 'Loot option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loot_option
      @loot_option = LootOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loot_option_params
      params.require(:loot_option).permit(:name)
    end
end
