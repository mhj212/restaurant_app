class ChangeTypeToCuisine < ActiveRecord::Migration
  def change

  	rename_column :restaurants, :type, :cuisine
  end
end
