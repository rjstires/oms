class TierTokensController < ApplicationController
  before_action :set_tier_token, only: [:show, :edit, :update, :destroy]

  # GET /tier_tokens
  # GET /tier_tokens.json
  def index
    @tier_tokens = TierToken.all
  end

  # GET /tier_tokens/1
  # GET /tier_tokens/1.json
  def show
  end

  # GET /tier_tokens/new
  def new
    @tier_token = TierToken.new
  end

  # GET /tier_tokens/1/edit
  def edit
  end

  # POST /tier_tokens
  # POST /tier_tokens.json
  def create
    @tier_token = TierToken.new(tier_token_params)

    respond_to do |format|
      if @tier_token.save
        format.html { redirect_to @tier_token, notice: 'Tier token was successfully created.' }
        format.json { render :show, status: :created, location: @tier_token }
      else
        format.html { render :new }
        format.json { render json: @tier_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tier_tokens/1
  # PATCH/PUT /tier_tokens/1.json
  def update
    respond_to do |format|
      if @tier_token.update(tier_token_params)
        format.html { redirect_to @tier_token, notice: 'Tier token was successfully updated.' }
        format.json { render :show, status: :ok, location: @tier_token }
      else
        format.html { render :edit }
        format.json { render json: @tier_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tier_tokens/1
  # DELETE /tier_tokens/1.json
  def destroy
    @tier_token.destroy
    respond_to do |format|
      format.html { redirect_to tier_tokens_url, notice: 'Tier token was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tier_token
      @tier_token = TierToken.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tier_token_params
      params.require(:tier_token).permit(:name)
    end
end
