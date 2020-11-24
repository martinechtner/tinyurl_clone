FactoryBot.define do
  factory :url_visitor do
    association :tiny_url, factory: :tiny_url
    ip { Faker::Internet::IPAddr }
  end
end
