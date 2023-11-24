class Gig < ApplicationRecord
	belongs_to :customer, class_name: 'User', foreign_key: 'customer_id'

	validates :title, presence: true
	validates :payment, presence: true
end
