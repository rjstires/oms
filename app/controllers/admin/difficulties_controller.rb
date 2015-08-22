class Admin::DifficultiesController < AdminController
  before_action :set_difficulty, only: [:show, :edit, :update, :destroy]

  def index
    @difficulties = ::Difficulty.all
  end

  def show
  end

  def new
    @difficulty = ::Difficulty.new
  end

  def edit
  end

  def create
    @difficulty = ::Difficulty.new(difficulty_params)

    respond_to do |format|
      if @difficulty.save
        format.html { redirect_to admin_difficulty_path(@difficulty), notice: 'Difficulty was successfully created.' }
        format.json { render :show, status: :created, location: @difficulty }
      else
        format.html { render :new }
        format.json { render json: @difficulty.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @difficulty.update(difficulty_params)
        format.html { redirect_to admin_difficulty_path(@difficulty), notice: 'Difficulty was successfully updated.' }
        format.json { render :show, status: :ok, location: @difficulty }
      else
        format.html { render :edit }
        format.json { render json: @difficulty.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @difficulty.destroy
    respond_to do |format|
      format.html { redirect_to admin_difficulties_url, notice: 'Difficulty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_difficulty
      @difficulty = ::Difficulty.find(params[:id])
    end

    def difficulty_params
      params.require(:difficulty).permit(:name)
    end
end
