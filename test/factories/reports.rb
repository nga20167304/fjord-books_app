FactoryBot.define do
  factory :report do
    sequence(:title) { |n| "タイトル#{n}" }
    sequence(:content) { |n| "内容#{n}" }
  end
end
