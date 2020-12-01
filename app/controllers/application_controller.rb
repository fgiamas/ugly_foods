class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :create_shopping_cart

  def create_shopping_cart
    @sum = 0
    if login? && @current_user.cart[:status] == "pending"
      @shopping_cart = @current_user.cart
      @shopping_cart.product_selections.each do |product_selection|
        if product_selection.units?
          item_sum = product_selection.product.price * product_selection.units
        else
          item_sum = product_selection.product.price * product_selection.kg
        end
        @sum += item_sum
      end
      @shopping_cart.total_price = @sum
    else
      @shopping_cart = Cart.create
      @shopping_cart.total_price = @sum
    end
  end

  def login?
    current_user
  end
end
