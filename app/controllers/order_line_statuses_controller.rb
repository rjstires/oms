class OrderLineStatusesController < ApplicationController
  before_action :set_order_line_status, only: [:show, :edit, :update, :destroy]

  # GET /order_line_statuses
  # GET /order_line_statuses.json
  def index
    @order_line_statuses = OrderLineStatus.all
  end

  # GET /order_line_statuses/1
  # GET /order_line_statuses/1.json
  def show
  end

  # GET /order_line_statuses/new
  def new
    @order_line_status = OrderLineStatus.new
  end

  # GET /order_line_statuses/1/edit
  def edit
  end

  # POST /order_line_statuses
  # POST /order_line_statuses.json
  def create
    @order_line_status = OrderLineStatus.new(order_line_status_params)

    respond_to do |format|
      if @order_line_status.save
        format.html { redirect_to @order_line_status, notice: 'Order line status was successfully created.' }
        format.json { render :show, status: :created, location: @order_line_status }
      else
        format.html { render :new }
        format.json { render json: @order_line_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_line_statuses/1
  # PATCH/PUT /order_line_statuses/1.json
  def update
    respond_to do |format|
      if @order_line_status.update(order_line_status_params)
        format.html { redirect_to @order_line_status, notice: 'Order line status was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_line_status }
      else
        format.html { render :edit }
        format.json { render json: @order_line_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_line_statuses/1
  # DELETE /order_line_statuses/1.json
  def destroy
    @order_line_status.destroy
    respond_to do |format|
      format.html { redirect_to order_line_statuses_url, notice: 'Order line status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_line_status
      @order_line_status = OrderLineStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_line_status_params
      params.require(:order_line_status).permit(:name)
    end
end
