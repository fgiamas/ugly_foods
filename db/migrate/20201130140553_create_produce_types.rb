class CreateProduceTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :produce_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
