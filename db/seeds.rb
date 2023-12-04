# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

tables = ActiveRecord::Base.connection.tables - ['schema_migrations']

tables.each do |table|
  ActiveRecord::Base.connection.execute "DELETE FROM `#{table}`"
end

all_users = ["Lidia", "Stacey", "Thomas", "Mauricio", "Jimmy", "Justin", "Mike", "Antonio", "Nalini", "Claudia"]
mapped_users = []

all_gigs = [	["Clean Room", "Need my room cleaned"],
	["Trash Pickup", "Need my trash thrown out"],
	["Dog Walking", "My dog needs to be taken out for a walk"],
	["Driver", "Need a ride to my upcoming event"],
	["Laundry", "I need my laundry done"],
	["Clean Bathroom", "Need my bathroom cleaned"],
	["Tiling", "I have some tiles that need to be put into my ceiling"],
	["Gardening", "I need some plants to be planted in my backyard"],
	["Massage", "I need a back massage"],
	["Clean Kitchen", "Need my kitchen cleaned"],
	["Clean Floor", "Need the floor of my apartment cleaned"],
	["Trash Pickup", "Need my old mattress thrown out"],
	["Moving Help", "Need help packing my furniture"],
	["Clean Apartment", "Need my entire apartment cleaned"]
]





all_users.each do |user_name|
	random_last_init = ('A'.ord + rand(26)).chr
	full_name = "#{user_name} #{random_last_init}."
	email = "#{user_name}@fake.com"
	password = "password"
	mapped_user = User.create(name:full_name, email:email, password: password, worker_rating: 0, balance:1000)
	mapped_users.push(mapped_user)
end

all_gigs.each do |gig|
	title, desc = gig
	payment = rand(1..100)
	road_num = rand(200..1000)
	street = rand(100..300)
	apt_num = rand(1..1000)
	zip_suffix = rand(10..99)
	location = "#{road_num} #{street}th St Apt #{apt_num} 100#{zip_suffix}, NY"
	customer = rand(1..all_users.length) - 1
	mapped_user = mapped_users[customer]
	Gig.create(title:title, description: desc, payment: payment, location: location, customer_id: mapped_user.id)
end





