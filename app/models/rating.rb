class Rating < ApplicationRecord
  belongs_to :recipient, class_name: 'User', foreign_key: 'recipient_id'
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :content, presence: true
  validates :rating_value, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
