class CartsController < ApplicationController

  def show
    @cart = current_user.current_cart
  end

  def update
    @cart = current_user.current_cart
    @cart.update(strong_params)
    @cart.update(status: 1)
    redirect_to dashboard_path
  end

  private

  def strong_params
    params.require(:cart).permit(:pick_up_date)
  end
end
