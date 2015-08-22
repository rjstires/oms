class Admin::PlayStylesController < AdminController
  before_action :set_play_style, only: [:show, :edit, :update, :destroy]

  def index
    @play_styles = ::PlayStyle.all
  end

  def show
  end

  def new
    @play_style = ::PlayStyle.new
  end

  def edit
  end

  def create
    @play_style = ::PlayStyle.new(play_style_params)

    respond_to do |format|
      if @play_style.save
        format.html { redirect_to admin_play_style_path(@play_style), notice: 'Play style was successfully created.' }
        format.json { render :show, status: :created, location: @play_style }
      else
        format.html { render :new }
        format.json { render json: @play_style.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @play_style.update(play_style_params)
        format.html { redirect_to admin_play_style_path(@play_style), notice: 'Play style was successfully updated.' }
        format.json { render :show, status: :ok, location: @play_style }
      else
        format.html { render :edit }
        format.json { render json: @play_style.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @play_style.destroy
    respond_to do |format|
      format.html { redirect_to admin_play_styles_url, notice: 'Play style was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_play_style
      @play_style = ::PlayStyle.find(params[:id])
    end

    def play_style_params
      params.require(:play_style).permit(:name)
    end
end
