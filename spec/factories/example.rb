FactoryGirl.define do
  factory :example, class: Example do
    text   { Faker::Lorem.paragraph }
  end
end
