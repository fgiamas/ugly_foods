 class ChatroomsController < ApplicationController
  def show
    @shop = Shop.find(params[:shop_id])
    @chatroom = Chatroom.find_or_create_by(shop: @shop, user: current_user)
    @message = Message.new

  end
end
