class RemoveStatusFromCarts < ActiveRecord::Migration[6.0]
  def change
    remove_column :carts, :status, :string
    add_column :carts, :status, :integer, default: 0
  end
end
