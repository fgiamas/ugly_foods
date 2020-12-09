 class ChatroomsController < ApplicationController
  def show
    # if notification.params[:message][:user_id]
    #   owner = User.find(notification.params[:message][:user_id])
    #   @shop = owner.shop
    # else
      @shop = Shop.find(params[:shop_id])
    # end
    # return @chatroom if create_if_not_exist
    # @chatroom = Chatroom.find(notification.params[:message][:chatroom_id])
    # if @chatroom.shop.user == current_user

    # else

    # end

    if @shop.user == current_user
      # For shopowners
      @chatroom = Chatroom.find_or_create_by(shop: current_user.shop, user: params[:user_id])
    else
      @chatroom = Chatroom.find_or_create_by(shop: @shop, user: current_user)
    end
    @message = Message.new
    redirect_to dashboard_path(messages: true)
  end

end
