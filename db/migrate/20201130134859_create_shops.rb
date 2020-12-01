class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|

      t.timestamps
    end
  end
end
