FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@gmail.com" }
    sequence(:name) { |n| "user#{n}" }
    sequence(:password) { "password" }
  end
end
