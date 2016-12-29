FactoryGirl.define do
  factory :user do
    name { Faker::GameOfThrones.character }
    email { Faker::Internet.email }
    password "please123"

    trait :admin do
      role 'admin'
    end
  end
end
