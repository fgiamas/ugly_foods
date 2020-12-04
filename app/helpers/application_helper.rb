module ApplicationHelper
  def current_cart
    current_user.current_cart if current_user
  end
end
