class Listing < ApplicationRecord
	belongs_to :user

	validates :listing_type, presence: true
	validates :price, presence: true

end
