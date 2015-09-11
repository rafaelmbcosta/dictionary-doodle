FactoryGirl.define do
  factory :search, class: Search do
    word { Faker::Lorem.word }
  end

  factory :search_with_entries, class: Search do
    word { Faker::Lorem.word }

    after(:create) do |search|
      2.times do
        entry = FactoryGirl.create(:entry, search_id: search.id)
        4.times do
          FactoryGirl.create(:example, entry_id: entry.id)
        end
      end
    end
  end

end
