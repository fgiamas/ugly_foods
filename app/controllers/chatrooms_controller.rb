 class ChatroomsController < ApplicationController
  def show
    @shop = Shop.find(params[:shop_id])
    if @shop.user == current_user
      # For shopowners
      @chatroom = Chatroom.find_or_create_by(shop: @shop, user: params[:user_id])
    else
      @chatroom = Chatroom.find_or_create_by(shop: @shop, user: current_user)
    end
    @message = Message.new
  end
end
