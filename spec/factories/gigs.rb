require 'faker'

FactoryBot.define do
  factory :gig do
    title { Faker::Lorem.sentence }
    payment { Faker::Number.decimal(l_digits: 2) }
		location { Faker::Lorem.sentence }
    association :customer, factory: :user
  end
  
   factory :invalid_gig, class: 'Gig' do
     title { nil }  # Ensure title is not present
     payment { nil } # Ensure payment is not present
     customer_id { nil }
   end
end