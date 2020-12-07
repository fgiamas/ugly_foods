# To deliver this notification:
#

 # CommentNotification.with(post: @message).deliver(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
  # deliver_by :database
  deliver_by :database, format: :to_database
  deliver_by :action_cable, channel: 'UserChannel'
  #deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  def to_database
    {
      type: self.class.name,
      params: params
    }
  end

  param :message

  # Define helper methods to make rendering easier.

  def message
    t(".message")
  end

  def url
    if params[:message].present?
    message_path(params[:message])
  else
    @message = Message.find(params[:message].id)
    message_path(@message.post)
  end
end

end
