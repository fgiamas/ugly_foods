class AddReferencesToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :user
    add_reference :chatrooms, :shop
  end
end
