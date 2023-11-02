class Gig < ApplicationRecord
	validates :title, presence: true
	validates :payment, presence: true
	validates :customer_id, presence: true
	
  belongs_to :customer
end
