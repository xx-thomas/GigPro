class Gig < ApplicationRecord
	validates :title, presence: true
	validates :payment, presence: true
	
  #belongs_to :customer
end
