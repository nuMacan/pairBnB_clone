# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker' 

#seed user
user = {}
user['password'] = 'qwerty'
# user['password_confirmation'] = 'qwerty'

ActiveRecord::Base.transaction do 
	20.times do 
		user['name'] = Faker::Name.unique.name
		user['email'] = Faker::Internet.email

		User.create(user) 
	end 
end 

#seed Listing
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
	40.times do 
	listing['listing_name'] = Faker::App.name
	listing['listing_type'] = ["Apartment", "Castle", "House", "Private Room", "Tree House", "Villa"].sample
	listing['number_of_rooms'] = rand(1..5)
	listing['city'] = ["Hanoi", "Jakarta", "Kuala Lumpur", "Singapore"].sample
	listing['price'] = rand(60..500)
	listing['wifi'] = Faker::Boolean
	listing['smoking_room'] = Faker::Boolean
	listing["user_id"] = uids.sample

	Listing.create(listing)
	end 
end 

