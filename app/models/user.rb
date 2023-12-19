class User < ApplicationRecord
  before_save { self.email = self.email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true
  has_secure_password
  has_many :received_ratings, class_name: 'Rating', foreign_key: 'recipient_id'
end