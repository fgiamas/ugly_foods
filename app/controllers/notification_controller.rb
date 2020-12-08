class NotificationController < ApplicationController
before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.newest_first.unread
  end
end
