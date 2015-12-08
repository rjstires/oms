class Admin::CustomerContactsController < ApplicationController
  before_action :set_customer_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_customer

  # GET /customer_contacts/new
  def new
    @customer_contact = @customer.customer_contacts.new
  end

  # GET /customer_contacts/1/edit
  def edit
  end

  # POST /customer_contacts
  # POST /customer_contacts.json
  def create
    @customer_contact = @customer.customer_contacts.new(customer_contact_params)

    respond_to do |format|
      if @customer_contact.save
        format.html { redirect_to admin_customer_path(@customer), notice: 'Customer contact was successfully created.' }
        format.json { render :show, status: :created, location: @customer_contact }
      else
        format.html { render :new }
        format.json { render json: @customer_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_contacts/1
  # PATCH/PUT /customer_contacts/1.json
  def update
    respond_to do |format|
      if @customer_contact.update(customer_contact_params)
        format.html { redirect_to admin_customer_path(@customer), notice: 'Customer contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_contact }
      else
        format.html { render :edit }
        format.json { render json: @customer_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_contacts/1
  # DELETE /customer_contacts/1.json
  def destroy
    @customer_contact.destroy
    respond_to do |format|
      format.html { redirect_to admin_customers_path, notice: 'Customer contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_contact
      @customer_contact = CustomerContact.find(params[:id])
    end

    def set_customer
      @customer = Customer.find(params[:customer_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_contact_params
      params.require(:customer_contact).permit(:value, :ctype)
    end
end
