class OrderLinesController < ApplicationController
  load_and_authorize_resource :team, :except => :upload
  load_and_authorize_resource :order_line, :through => :team, :except => :upload
  before_filter :set_default_category, :only => :index

  # GET /order_lines
  # GET /order_lines.json
  def index
    @order_lines = @team.order_lines
    .includes(:team,
      :customer,
      :order_line_status,
      :payment_status,
      character: [:classification],
      product: [:category])
    .accessible_by(current_ability)

    @order_lines = @order_lines.by_status(params[:status]) if params.has_key?(:status)
    @order_lines = @order_lines.by_category(params[:category]) if params.has_key?(:category)

    if params[:status] == 'completed'
      @order_lines = @order_lines.order('order_lines.completed_at DESC')
    elsif params[:status] == 'scheduled'
      @order_lines = @order_lines.order('order_lines.scheduled_at DESC')
    else
      @order_lines = @order_lines.order('order_lines.created_at DESC')
    end

    @categories = @team.categories
    @order_line_statuses = OrderLine.by_team(@team).by_category(params[:category]).select('options.name as name').joins(:order_line_status).group('name').count('order_lines.id')

    authorize! :read, OrderLine
  end

  # GET /order_lines/1
  # GET /order_lines/1.json
  def show
  end

  # GET /order_lines/new
  def new
    @order_line = @team.order_lines.new
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

  # GET /order_lines/1/edit
  def edit
  end
  # get /team/sales/1/complete
  def complete
    @order_line = @team.order_lines.find(params[:order_line_id])
    @order_line.complete
    authorize! :complete, @order_line

    redirect_to team_order_lines_path(@team), notice: 'Order completed, thank you!'
  end

  # POST /order_lines
  # POST /order_lines.json
  def create

    @order_line = @team.order_lines.new(order_line_params)

    respond_to do |format|
      if @order_line.save
        format.html { redirect_to team_order_lines_path(@order_line.team), notice: 'Order line was successfully created.' }
        format.json { render :show, status: :created, location: @order_line }
      else
        format.html { render :new }
        format.json { render json: @order_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_lines/1
  # PATCH/PUT /order_lines/1.json
  def update
    respond_to do |format|
      if @order_line.update(order_line_params)
        format.html { redirect_to team_order_line_path(@order_line.team, @order_line), notice: 'Order line was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_line }
      else
        format.html { render :edit }
        format.json { render json: @order_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_lines/1
  # DELETE /order_lines/1.json
  def destroy
    @order_line.destroy
    respond_to do |format|
      format.html { redirect_to team_order_lines_path(@team), notice: 'Order line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upload
    OrderLine.importJSON( params[:file] )
    redirect_to root_path
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def order_line_params
    params.require(:order_line).permit(:order,
      :product_id,
      :customer_id,
      :team_id,
      :character_id,
      :order_line_status_id,
      :payment_status_id,
      :sale,
      :merchant_fee,
      :site_fee,
      :contractor_payment,
      :scheduled_at,
      :region_id,
      :faction_id)
  end

  def set_default_category
    redirect_to :category => Category.raiding.display_name.downcase if params[:category].blank?
  end
end
