FactoryGirl.define do
  factory :slot do
    product

    factory :slot_vacancy do
      order_line nil
    end
  end
end
