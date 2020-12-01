class AddColumnsToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :name, :string
    add_column :shops, :website, :string
    add_column :shops, :address, :string
    add_column :shops, :post_code, :string
    add_column :shops, :city, :string
    add_column :shops, :country, :string
    add_column :shops, :phone_number, :string
    add_reference :shops, :user, foreign_key: true
  end
end
