FactoryBot.define do
  factory :tiny_url do
    original_url { Faker::Internet::url }
  end
end
