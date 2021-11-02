FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "タイトル#{n}" }
    sequence(:memo) { |n| "内容#{n}" }
    sequence(:author) {|n| "作家#{n}" }
    after :create do |b|
      b.update_column(:picture, 'test/fixtures/files/book.jpg')
    end
  end
end
