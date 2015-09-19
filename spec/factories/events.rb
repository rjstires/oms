FactoryGirl.define do

  factory :event do
    team
    category
    difficulty
    zone
    start_datetime { Time.now + 14.days }
    cutoff_datetime { start_datetime - 1.day }

    factory :past_event do
      start_datetime { Time.now - 14.days }
      cutoff_datetime { start_datetime - 1.day }
    end

    factory :future_event do
      start_datetime { Time.now + 7.days }
      cutoff_datetime { start_datetime - 1.day }
    end

    trait :with_vacancy do
      after :create do |event|
        create_list(:slot_vacancy, 3, event: event, product: event.category)
      end
    end
  end
end

