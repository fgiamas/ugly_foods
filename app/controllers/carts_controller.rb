class CartsController < ApplicationController

  def show
    @cart = current_user.current_cart
  end

  def purchase
    current_user.current_cart.update(status: 1)
  end

  private

  def strong_params
    params.require(:product).permit(:product, :units, :kgs)
  end
end
