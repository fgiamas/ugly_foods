class AddColumnsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :category, :string
    add_column :products, :status, :string
  end
end
