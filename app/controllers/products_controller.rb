class ProductsController < ApplicationController
  before_action :find_products, except: [:dashboard, :create]
  before_action :authenticate_user!

  def dashboard
    @products = Product.all
    @product = Product.new
  end

  def new
  end

  def create
    @product = Product.new(strong_params)
    @product.shop = current_user.shop
    @product.days_to_expiry = params[:product][:lifespan].to_i
    if @product.save
      redirect_to dashboard_url, notice: 'product created'
    else
      render dashboard_url, notice: 'something went wrong'
    end
  end

  def edit
    @product
  end

  def update
    @product
    if @product.update(strong_params)
      redirect_to dashboard_url, notice: 'product updated'
    else
      render dashboard_url, notice: 'something went wrong'
    end
  end

  def destroy
    @product.destroy
    redirect_back(fallback_location: root_path, notice: 'product deleted')
  end

  private

  def strong_params
    params.require(:product).permit(:discount_percent, :price_per_unit, :lifespan, :total_units, :total_kg, :produce_type_id, :category, :status)
  end

  def find_products
    @product = Product.find(params[:id])
  end

end
