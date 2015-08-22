class Admin::FactionsController < AdminController
  before_action :set_faction, only: [:show, :edit, :update, :destroy]

  def index
    @factions = ::Faction.all
  end

  def show
  end

  def new
    @faction = ::Faction.new
  end

  def edit
  end

  def create
    @faction = ::Faction.new(faction_params)

    respond_to do |format|
      if @faction.save
        format.html { redirect_to admin_faction_path(@faction), notice: 'Faction was successfully created.' }
        format.json { render :show, status: :created, location: @faction }
      else
        format.html { render :new }
        format.json { render json: @faction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @faction.update(faction_params)
        format.html { redirect_to admin_faction_path(@faction), notice: 'Faction was successfully updated.' }
        format.json { render :show, status: :ok, location: @faction }
      else
        format.html { render :edit }
        format.json { render json: @faction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @faction.destroy
    respond_to do |format|
      format.html { redirect_to admin_factions_url, notice: 'Faction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_faction
      @faction = ::Faction.find(params[:id])
    end

    def faction_params
      params.require(:faction).permit(:name)
    end
end
