FactoryGirl.define do
  factory :search, class: Search do
    word { Faker::Lorem.word }
  end

  factory :search_with_entries, class: Search do
    word { Faker::Lorem.word }

    after(:create) do |search|
      2.times{ FactoryGirl.create(:entry, search_id: search.id) }
    end
  end
end
