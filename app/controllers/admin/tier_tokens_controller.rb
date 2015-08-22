class Admin::TierTokensController < AdminController
  before_action :set_tier_token, only: [:show, :edit, :update, :destroy]

  def index
    @tier_tokens = ::TierToken.all
  end

  def show
  end

  def new
    @tier_token = ::TierToken.new
  end

  def edit
  end

  def create
    @tier_token = ::TierToken.new(tier_token_params)

    respond_to do |format|
      if @tier_token.save
        format.html { redirect_to admin_tier_token_path(@tier_token), notice: 'TierToken was successfully created.' }
        format.json { render :show, status: :created, location: @tier_token }
      else
        format.html { render :new }
        format.json { render json: @tier_token.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tier_token.update(tier_token_params)
        format.html { redirect_to admin_tier_token_path(@tier_token), notice: 'TierToken was successfully updated.' }
        format.json { render :show, status: :ok, location: @tier_token }
      else
        format.html { render :edit }
        format.json { render json: @tier_token.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tier_token.destroy
    respond_to do |format|
      format.html { redirect_to admin_tier_tokens_url, notice: 'TierToken was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_tier_token
      @tier_token = ::TierToken.find(params[:id])
    end

    def tier_token_params
      params.require(:tier_token).permit(:name)
    end
end
