class Listing < ApplicationRecord
	belongs_to :user
	has_many :listings
	

	validates :listing_type, presence: true
	validates :price, presence: true



end
