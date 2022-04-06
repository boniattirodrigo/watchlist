FactoryBot.define do
  factory :asset do
    sequence(:symbol) { |n| "SOJA#{n}" }
    currency { 'BRL' }
  end
end
