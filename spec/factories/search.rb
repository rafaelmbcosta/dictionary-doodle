FactoryGirl.define do
  factory :search, class: Search do
    word { Faker::Lorem.word }
  end
end
