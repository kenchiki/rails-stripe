class UserPlan < ApplicationRecord
  # TODO:subscriptionにモデル名を変えたい（stripeに合わせたい）
  belongs_to :user
  belongs_to :plan

  attribute :stripe_plan_id, :string
  attribute :stripeToken, :string

  validate ->(user_plan) {
    unless Plan.stripe_plan_id.values.include?(user_plan.stripe_plan_id)
      errors.add(:stripe_plan_id, 'が正しくありません')
    end
  }, on: :update

  # TODO:start planに変更時はTokenなかったらバリデーションでエラーにする
  before_update :change_plan

  private

  def change_plan
    self.plan = Plan.find_by!(stripe_plan_id: stripe_plan_id)

    # TODO:エラー時にraise
    if plan.stripe_plan_id.free?
      subscription = Stripe::Subscription.retrieve(
        user.stripe_subscription_id
      )
      subscription.plan = Stripe::Plan.retrieve(Plan.stripe_plan_id.find_value(:free).value)
      subscription.save
    end

    # TODO:エラー時にraise
    if plan.stripe_plan_id.start?
      Stripe::Customer.update(
        user.stripe_customer_id,
        source: stripeToken
      )

      subscription = Stripe::Subscription.retrieve(
        user.stripe_subscription_id
      )
      subscription.plan = Stripe::Plan.retrieve(Plan.stripe_plan_id.find_value(:start).value)
      subscription.save
    end
  end
end
