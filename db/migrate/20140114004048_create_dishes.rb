class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
