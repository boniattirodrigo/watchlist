FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@.sdf.com" }
    password { '123456' }
  end
end
