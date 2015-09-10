FactoryGirl.define do

  factory :user do
    name "John A. User"
    battle_tag "battle#1234"
    skype "skype.address"
    email "john.a.user@example.com"
    password "password"
    confirmed_at Time.zone.now
    # email Faker::Internet.email
  end

  factory :admin_user, class: User do
    name "A. Admin User"
    battle_tag "battle#1234"
    skype "skype.address"
    email "a.admin.user@example.com"
    password "password"
    role "admin"
    confirmed_at Time.zone.now
    # email Faker::Internet.email
  end

  factory :approved_user, class: User do
    name "A. Approved User"
    battle_tag "battle#1234"
    skype "skype.address"
    email "a.approved.user@example.com"
    password "password"
    role "approved"
    confirmed_at Time.zone.now
    # email Faker::Internet.email
  end
end