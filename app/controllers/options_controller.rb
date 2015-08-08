class OptionsController < ApplicationController
  before_action :set_option, only: [:show, :edit, :update, :destroy]
  before_action :set_type
  include OptionsHelper
  load_and_authorize_resource
  
  # GET /options
  # GET /options.json
  def index
    @options = type_class.order(:type, :name).all
  end

  # GET /options/1
  # GET /options/1.json
  def show
  end

  # GET /options/new
  def new
    @option = type_class.new
  end

  # GET /options/1/edit
  def edit
  end

  # POST /options
  # POST /options.json
  def create
    @option = type_class.new(option_params)

    respond_to do |format|
      if @option.save
        format.html { redirect_to @option, notice: "#{type} was successfully created." }
        format.json { render :show, status: :created, location: @option }
      else
        format.html { render :new }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /options/1
  # PATCH/PUT /options/1.json
  def update
    respond_to do |format|
      if @option.update(option_params)
        format.html { redirect_to @option, notice: "#{type} was successfully updated." }
        format.json { render :show, status: :ok, location: @option }
      else
        format.html { render :edit }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /options/1
  # DELETE /options/1.json
  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to "/#{type.underscore.pluralize}", notice: "#{type} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def display_name
    self.name.titleize
  end

  private

  def set_type
    @type = type
  end

  def type
    Option.types.include?(params[:type]) ? params[:type] : "Option"
  end

  def type_class
    type.constantize
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_option
      @option = type_class.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def option_params
      params.require(type.underscore.to_sym).permit(:name, :type)
    end
end
