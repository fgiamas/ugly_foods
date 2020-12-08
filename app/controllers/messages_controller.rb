class MessagesController < ApplicationController
  def create

    @chatroom = Chatroom.find(params[:message][:chatroom])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save

      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
        )

      if @chatroom.shop_id == current_user.id
        user = @chatroom.user
      else
        user = @chatroom.shop
      end
      CommentNotification.with(message: @message).deliver(user)

    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
