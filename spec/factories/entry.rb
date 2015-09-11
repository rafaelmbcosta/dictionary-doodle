FactoryGirl.define do
  factory :entry, class: Entry do
    sequence(:word)   { |n| "#{n}#{Faker::Lorem.word}" }
    grammar_group     { Faker::Lorem.word }
  end
end
