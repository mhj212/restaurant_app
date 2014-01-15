# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.delete_all
Dish.delete_all
Chef.delete_all

#Chefs
c = Chef.create({
	name: "Thomas Keller",
	})


c2 = Chef.create({
	name: "Maribel Araujo",
	})

c3 = Chef.create({
	name: "Matthew Palondino",
	})

c4 = Chef.create({
	name: "Marco Canora",
	})


#Restaurant:
r = Restaurant.create({
	name: "Per Se",
	rating: 5,
	chef_id: c.id
	})

r2 = Restaurant.create({
	name: "Caracas Arepa Bar",
	rating: 8,
	chef_id: c2.id
	})

r3 = Restaurant.create({
	name: "Motorino",
	rating: 9,
	chef_id: c3.id
	})

r4 = Restaurant.create({
	name: "Hearth",
	rating: 9,
	chef_id: c4.id
	})





#Dishes
d = Dish.create({
	name: "Oysters and Pearls",
	restaurant_id: r.id
	})

d2 = Dish.create({
    name: "Arepa",
    restaurant_id: r2.id
	})

d3 = Dish.create({
	name: "Brussel sprouts and pancetta pizza",
	restaurant_id: r3.id
		})

d4 = Dish.create({
	name: "Rigatoni with Pork Ragu",
	restaurant_id: r4.id
	})