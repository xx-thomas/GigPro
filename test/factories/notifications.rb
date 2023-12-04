FactoryBot.define do
  factory :notification do
    read { false }
    user { nil }
    gig { nil }
  end
end
