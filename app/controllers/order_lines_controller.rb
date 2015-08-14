class OrderLinesController < ApplicationController
  load_and_authorize_resource :team, :except => [:upload, :send_confirmation]
  load_and_authorize_resource :order_line, :except => [:upload, :send_confirmation], :through => :team

  before_filter :set_default_category, :only => :index

  # GET /order_lines
  # GET /order_lines.json
  def index
    @order_lines = @team
    .order_lines
    .includes(
      :order_line_status,
      :payment_status,
      :customer,
      :character => [:classification],
      :product => [:difficulty, :zone]
      )
    .filter( params.slice(:status, :category, :difficulty) )
    .date_sort(params[:status])
    .accessible_by(current_ability)

    @categories = Category.all
    @order_line_statuses = OrderLineStatus.all

    authorize! :read, OrderLine
  end

  # GET /teams/1/sales/1
  def show
  end

  # GET /teams/1/sales/new
  def new
    @order_line = @team.order_lines.new
    @products = Product.includes(:category, :zone, :play_style, :loot_option, :difficulty, :mount).all
    @characters = Character.includes(:classification).all
    @categories = Category.all
    @difficulties = Difficulty.all
    @loot_options = LootOption.all
    @mounts = Mount.all
    @play_styles = PlayStyle.all
    @zones = Zone.all

    authorize! :create, OrderLine
  end

  # GET /teams/1/sales/1/edit
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

  # GET /team/1/sales/1/send_confirmation
  def send_confirmation
    @team = Team.find(params[:team_id])
    OrderMailer.confirmation_email(params[:order_line_id]).deliver_now
    redirect_to team_order_lines_path(@team), notice: 'Email confirmation sent!'
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
    redirect_to :category => Category.find_by(name: 'raiding').id if params[:category].blank?
  end
end
