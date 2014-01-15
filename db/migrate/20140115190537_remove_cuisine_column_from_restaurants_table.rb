class RemoveCuisineColumnFromRestaurantsTable < ActiveRecord::Migration
  def up
  end

  def down
  	remove_column :restaurants, :cuisine
  end
end
