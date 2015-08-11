class LeadsController < OrderLinesController

  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.includes(:product, :order_line_status, :payment_status, character: [:classification], ).accessible_by(current_ability)
    @leads = @leads.by_team(params[:team_id]) if params.has_key?(:team_id)
    @leads = @leads.by_status(params[:status]) if params.has_key?(:status)
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
    @leads = Lead.find(params[:id])
  end

  # GET /leads/new
  def new
    @lead = Lead.new
    @products = Product.includes(:category, :zone, :play_style, :loot_option, :difficulty, :mount).all
    
    @options = Option.pluck(:id, :name, :type)
    @categories = Array.new(@options).keep_if {|o| o[2] == 'Category'}
    @difficulties = Array.new(@options).keep_if {|o| o[2] == 'Difficulty'}
    @loot_options = Array.new(@options).keep_if {|o| o[2] == 'LootOption'}
    @mounts = Array.new(@options).keep_if {|o| o[2] == 'Mount'}
    @play_styles = Array.new(@options).keep_if {|o| o[2] == 'PlayStyle'}
    @zones = Array.new(@options).keep_if {|o| o[2] == 'Zone'}
    
    authorize! :create, OrderLine
  end

  # GET /leads/1/edit
  def edit
    @lead = Lead.find(params[:id])
  end
  # get /team/sales/1/complete
  def complete
    @lead.order_line_status.complete!
  end
  
  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)

    respond_to do |format|
      if @lead.save
        format.html { redirect_to leads_path, notice: 'Order line was successfully created.' }
        format.json { render :show, status: :created, location: @lead }
      else
        format.html { render :new }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  def update
    @lead = Lead.find(params[:id])
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to leads_path, notice: 'Order line was successfully updated.' }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lead/1
  # DELETE /lead/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'Order line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 
  
  private  
    # Never trust parameters from the scary internet, only allow the white list through.
  def lead_params
    params.require(:lead).permit(:order,
        :product_id,
        :customer_id,
        :team_id,
        :character_id,
        :payment_status_id,
        :sale,
        :merchant_fee,
        :site_fee,
        :contractor_payment)
    end
end
