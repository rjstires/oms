class Admin::ProductsController < AdminController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def search
    @products = Product
      .includes(:category, :zone, :difficulty, :mount, :loot_option, :play_style)
      .order(description: :asc)

    params[:data].each do |filter|
      key = filter[0]
      value = filter[1].to_sym

      eval("@products = @products.joins(:#{key}).merge(#{key.camelize}.by_name('#{value.to_s}'))")
    end
  end

  def index
    @products = ::Product
    .includes(:category, :zone, :difficulty, :mount, :loot_option, :play_style)
    .order('categories.name ASC, zones.name ASC, difficulties.name ASC, mounts.name ASC, loot_options.name ASC, play_styles.name ASC, products.description ASC')
    .all

    @duplicate_products = Product.select(
      :description,
      :category_id,
      :zone_id,
      :play_style_id,
      :loot_option_id, :mount_id, :difficulty_id)
    .group(
      :description,
      :category_id,
      :zone_id,
      :play_style_id,
      :loot_option_id,
      :mount_id,
      :difficulty_id)
    .having("count(*) > 1")
  end

  def show
  end

  def new
    @product = ::Product.new
  end

  def edit
  end

  def create
    @product = ::Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_path(@product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_product_path(@product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_product
    @product = ::Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:description, :category_id, :zone_id, :difficulty_id, :loot_option_id, :mount_id, :play_style_id)
  end
end
