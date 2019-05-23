class User < ApplicationRecord
  has_one :user_plan
  has_one :plan, through: :user_plan

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :create_stripe_customer

  private

  # ユーザー作成時に無料プランに自動加入
  def create_stripe_customer
    # TODO:エラー処理
    # TODO:ユーザ削除時のサブスクリプション削除
    stripe_customer = Stripe::Customer.create(
      email: email
    )
    self.stripe_customer_id = stripe_customer.id
    self.plan = Plan.find_by!(stripe_plan_id: Plan.stripe_plan_id.find_value(:free).value)
    raise 'プランが保存できません' unless user_plan.valid?

    stripe_subscription = Stripe::Subscription.create(
      customer: stripe_customer,
      items: [{ plan: Plan.stripe_plan_id.find_value(:free).value }]
    )
    self.stripe_subscription_id = stripe_subscription.id
  end
end
