class Admin::CustomersController < AdminController
  before_action :set_customer, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_order_totals, only: [:index, :show]
  before_action :set_recent_orders, only: [:index, :show]

  # GET /Customers
  # GET /Customers.json
  def index
    @customers = Customer.includes(:order_lines).order(email: :asc)
  end

  # GET /Customers/1
  # GET /Customers/1.json
  def show
  end

  # GET /Customers/new
  def new
    @customer = Customer.new
  end

  # GET /Customers/1/edit
  def edit
  end

  # POST /Customers
  # POST /Customers.json
  def create
    @customer = ::Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to admin_customer_path(@customer), notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Customers/1
  # PATCH/PUT /Customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to admin_customer_path(@customer), notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Customers/1
  # DELETE /Customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to admin_customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      if params[:id]
        @customer = Customer.find(params[:id])
      else
        @customer = Customer.first
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:email, :battle_tag, :skype)
    end

   def set_recent_orders
      @completed_orders = @customer
        .order_lines
        .where_completed
        .completed_at_desc
   end

    def set_order_totals
      @customers_completed_orders = @customer.order_lines.where_completed
    end
end
