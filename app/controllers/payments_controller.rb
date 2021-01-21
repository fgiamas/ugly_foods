class PaymentsController < ApplicationController
  def new
    @cart = current_user.carts.where(status: 'pending').find(params[:cart_id])
  end
end
