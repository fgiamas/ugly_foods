class CreateProductSelections < ActiveRecord::Migration[6.0]
  def change
    create_table :product_selections do |t|
      t.references :product, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.integer :units
      t.integer :kg

      t.timestamps
    end
  end
end
