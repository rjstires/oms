class Admin::ClassificationsController < AdminController
  before_action :set_classification, only: [:show, :edit, :update, :destroy]

  def index
    @classifications = ::Classification.all
  end

  def show
  end

  def new
    @classification = ::Classification.new
  end

  def edit
  end

  def create
    @classification = ::Classification.new(classification_params)

    respond_to do |format|
      if @classification.save
        format.html { redirect_to admin_classification_path(@classification), notice: 'Classification was successfully created.' }
        format.json { render :show, status: :created, location: @classification }
      else
        format.html { render :new }
        format.json { render json: @classification.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @classification.update(classification_params)
        format.html { redirect_to admin_classification_path(@classification), notice: 'Classification was successfully updated.' }
        format.json { render :show, status: :ok, location: @classification }
      else
        format.html { render :edit }
        format.json { render json: @classification.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @classification.destroy
    respond_to do |format|
      format.html { redirect_to admin_classifications_url, notice: 'Classification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_classification
      @classification = ::Classification.find(params[:id])
    end

    def classification_params
      params.require(:classification).permit(:name)
    end
end
