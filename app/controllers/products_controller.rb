class ProductsController < ApplicationController
  before_action :find_products, except: [:dashboard]
  before_action :authenticate_user!

  def dashboard
    @products = Product.all
  end

  def new
    @product
  end

  def create
    @product = Product.new(strong_params)
    @product.shop = current_user.shop
    @product.days_to_expiry = Date.today - params[:lifespan]
    unless @product.save
      render :new
    end
  end

  def edit
    @product
  end

  def update
    @product
    @product.update(strong_params)
  end

  def destroy
    @product.destroy
  end

  private

  def strong_params
    params.require(:product).permit(:discount_percent, :price_per_unit, :lifespan, :total_units, :total_kg, :produce_type_id, :category, :status)
  end

  def find_products
    @product = Product.find(params[:id])
  end

end
