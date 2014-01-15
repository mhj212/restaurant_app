class AddChefIdToRestaurantTable < ActiveRecord::Migration
  def change
  	add_column :restaurants, :chef_id, :integer
  end
end
