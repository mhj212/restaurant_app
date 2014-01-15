class Chef < ActiveRecord::Base
  attr_accessible :name

  has_many :dishes, through: :restaurants
  has_many :restaurants
end
