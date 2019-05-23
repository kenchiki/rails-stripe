FactoryBot.define do
  factory :plan do
    amount { 1 }
    stripe_plan_id { "MyString" }
  end
end
