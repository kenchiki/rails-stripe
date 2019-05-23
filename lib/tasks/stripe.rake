# frozen_string_literal: true

# usage:`rails administrator:become USER_ID=1`
namespace :stripe do
  # TODO:エラー処理と商品は削除できない（商品はstripeの管理画面で手動削除）たぶん、商品も削除する場合はproduct idをDBに持たせる必要あり
  desc 'Stripeのテストデータ全部削除'
  task delete_all: :environment do
    User.find_each do |user|
      begin
        Stripe::Customer.delete(
          user.stripe_customer_id
        )
      rescue => e
      end
    end

    Plan.find_each do |plan|
      begin
        Stripe::Plan.delete(
          plan.stripe_plan_id
        )
      rescue => e
      end
    end
  end
end
