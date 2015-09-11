class Admin::CustomersController < AdminController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /Customers
  # GET /Customers.json
  def index
    
   @customers = Customer.
                 with_order_totals.
                 order('customers.email ASC')
  end

  # GET /Customers/1
  # GET /Customers/1.json
  def show
    @completed_orders = @customer.order_lines.where_completed
  end

  # GET /Customers/new
  def new
    @customer = ::Customer.new
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
      @customer = ::Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:email, :battle_tag, :skype)
    end
end
