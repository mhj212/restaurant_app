class Restaurant < ActiveRecord::Base
  attr_accessible :name, :cuisine, :rating, :chef_id

  belongs_to :chef #foreign key => chef_id
  has_many :dishes
end
