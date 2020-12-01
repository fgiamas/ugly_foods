class CartsController < ApplicationController
  before_action :find_product_selection

  def add_item_to_cart
    @product_selection = Product_selection.new(strong_params)
    @product_selection.cart = current_user.cart

    @shopping_cart.product_selections.each do |product_selection|
      if product_selection.units?
        item_sum = product_selection.product.price * product_selection.units
      else
        item_sum = product_selection.product.price * product_selection.kg
      end
      @sum += item_sum
    end
  end

  def remove_item_from_cart
    @product_selection.destroy
    @shopping_cart.product_selections.each do |product_selection|
      if product_selection.units?
        item_sum = product_selection.product.price * product_selection.units
      else
        item_sum = product_selection.product.price * product_selection.kg
      end
      @sum += item_sum
    end
  end

  private

  def find_product_selection
    @product_selection = Product_selection.find(params[:id])
  end

  def strong_params
    params.require(:product).permit(:product, :units, :kgs)
  end
end
