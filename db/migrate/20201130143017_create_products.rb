class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :discount_percent
      t.integer :price_per_unit
      t.integer :lifespan
      t.references :shop, null: false, foreign_key: true
      t.integer :total_units
      t.integer :total_kg
      t.boolean :sold_status, default: false
      t.integer :days_to_expiry
      t.references :produce_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
