FactoryBot.define do
  factory :quote do
    price { 150 }
    current { true }
    asset
  end
end
