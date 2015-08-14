class PlayStylesController < ApplicationController
  before_action :set_play_style, only: [:show, :edit, :update, :destroy]

  # GET /play_styles
  # GET /play_styles.json
  def index
    @play_styles = PlayStyle.all
  end

  # GET /play_styles/1
  # GET /play_styles/1.json
  def show
  end

  # GET /play_styles/new
  def new
    @play_style = PlayStyle.new
  end

  # GET /play_styles/1/edit
  def edit
  end

  # POST /play_styles
  # POST /play_styles.json
  def create
    @play_style = PlayStyle.new(play_style_params)

    respond_to do |format|
      if @play_style.save
        format.html { redirect_to @play_style, notice: 'Play style was successfully created.' }
        format.json { render :show, status: :created, location: @play_style }
      else
        format.html { render :new }
        format.json { render json: @play_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /play_styles/1
  # PATCH/PUT /play_styles/1.json
  def update
    respond_to do |format|
      if @play_style.update(play_style_params)
        format.html { redirect_to @play_style, notice: 'Play style was successfully updated.' }
        format.json { render :show, status: :ok, location: @play_style }
      else
        format.html { render :edit }
        format.json { render json: @play_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /play_styles/1
  # DELETE /play_styles/1.json
  def destroy
    @play_style.destroy
    respond_to do |format|
      format.html { redirect_to play_styles_url, notice: 'Play style was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_play_style
      @play_style = PlayStyle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def play_style_params
      params.require(:play_style).permit(:name)
    end
end
