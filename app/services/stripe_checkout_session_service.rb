class StripeCheckoutSessionService
  def call(event)
    cart = Cart.find_by(checkout_session_id: event.data.object.id)
    cart.update(status: 'confirmed')
  end
end
