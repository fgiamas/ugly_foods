class CartsController < ApplicationController

  def create
  cart = Cart.find(params[:cart_id])
  #order  = Order.create!(teddy: teddy, teddy_sku: teddy.sku, amount: teddy.price, state: 'pending', user: current_user)

  session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: cart,
      amount: (cart.calculate_price * 100).to_i,
      currency: 'eur',
      quantity: 1
    }],
    success_url: cart_url(cart),
    cancel_url: cart_url(cart)
  )

  cart.update(checkout_session_id: session.id)
  redirect_to new_cart_payment_path(cart)
end



  def show
    #@cart = current_user.current_cart
    @order = current_user.carts.find(params[:id])
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
