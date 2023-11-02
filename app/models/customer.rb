class Customer < ApplicationRecord
	validates :name, presence: true
	validates :location, presence: true

	has_one :gigs
end
