class CartsController < ApplicationController
  before_action :find_product_selection

  def add_item_to_cart
    @product_selection = Product_selection.new(strong_params)
    @product_selection.cart = current_cart
  end

  def remove_item_from_cart
    @product_selection.destroy
  end

  def show
    @cart = current_user.current_cart
  end

  def purchase
    current_user.current_cart.update(status: 1)
  end

  private

  def find_product_selection
    @product_selection = Product_selection.find(params[:id])
  end

  def strong_params
    params.require(:product).permit(:product, :units, :kgs)
  end
end
