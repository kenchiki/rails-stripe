# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Plan.create!(
  amount: 0,
  stripe_plan_id: Plan.stripe_plan_id.find_value(:free).value,
  product_name: 'Free Plan',
)

Plan.create!(
  amount: 1000,
  stripe_plan_id: Plan.stripe_plan_id.find_value(:start).value,
  product_name: 'Start Plan',
)

CURRENCY = 'jpy'
INTERVAL = 'month'
PRODUCT_TYPE = 'service'

# TODO:Planを作成時に同期する仕組みにできればベスト
# TODO:エラー処理
Plan.find_each do |plan|
   Stripe::Plan.create(
    id: plan.stripe_plan_id,
    product: {
      name: plan.product_name,
      type: PRODUCT_TYPE
    },
    amount: plan.amount,
    currency: CURRENCY,
    interval: INTERVAL
  )
end
