FactoryBot.define do
  factory :post do
    association :user
    title { "Sample Title" }
    body { "Sample body content for the post." }
  end
end