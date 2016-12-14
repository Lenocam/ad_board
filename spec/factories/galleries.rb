FactoryGirl.define do
  factory :gallery do
    title { Faker::Book.title }
    association :user
  end
end
