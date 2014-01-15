class Dish < ActiveRecord::Base
  attr_accessible :name, :restaurant_id
  
  belongs_to :restaurant
  
end
