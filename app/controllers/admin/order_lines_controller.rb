class Admin::OrderLinesController < AdminController
  before_action :set_order_line, only: [:show, :edit, :update, :destroy, :complete, :send_confirmation]

  def completed
    @completed_order_lines = ::OrderLine
    .index_join
    .where_completed
    .completed_at_desc

    store_location
  end

  def show
  end

  def new
    @title = 'Create Order';
    @order_line = ::OrderLine.new
  end

  def edit
    @title = 'Edit Order';
  end

  def create
    @order_line = OrderLine.new(order_line_params)

    respond_to do |format|
      if @order_line.save!
        format.html { redirect_to admin_order_line_path(@order_line), notice: 'Order line was successfully created.' }
        format.json { render :show, status: :created, location: @order_line }
      else
        format.html { render :new}
        format.json { render json: @order_line.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order_line.update(order_line_params)
        format.html { redirect_to admin_order_line_path(@order_line), notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_line }
      else
        format.html { render :edit }
        format.json { render json: @order_line.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order_line.destroy
    respond_to do |format|
      format.html { redirect_to admin_root_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  # GET /admin/order_lines/1/send_confirmation
  def send_confirmation
    OrderMailer.confirmation_email(@order_line).deliver_now
    flash[:notice] = 'Email confirmation sent!'
    redirect_to admin_order_line_path(@order_line)
  end

  def complete
    respond_to do |format|
      if @order_line.complete_order
        format.html { redirect_to admin_order_line_path(@order_line), notice: 'Order has been completed.' }
      end
    end
  end

  private
  private
  def set_order_line
    @order_line = ::OrderLine.find(params[:id])
  end

  def order_line_params
    params.require(:order_line).permit(
      :order,
      :product_id,
      :team_id,
      :character_id,
      :order_paid,
      :team_paid,
      :customer_id,
      :region_id,
      :faction_id,
      :sale,
      :merchant_fee,
      :site_fee,
      :contractor_payment,
      :scheduled_at,
      :completed_at,
      )
  end
end
