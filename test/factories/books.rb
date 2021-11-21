# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "タイトル#{n}" }
    sequence(:memo) { |n| "内容#{n}" }
    sequence(:author) { |n| "作家#{n}" }
  end
end
