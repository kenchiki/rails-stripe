class My::UserPlansController < ApplicationController
  before_action :set_user_plan, only: %i[show edit update]
  before_action :require_start, only: %i[start]

  def index
    @user_plans = UserPlan.all
  end

  def show
  end

  def edit
  end

  def update
    if @user_plan.update(user_plan_params)
      redirect_to [:my, @user_plan], notice: 'User plan was successfully updated.'
    else
      render :edit
    end
  end

  def free
  end

  def start

  end

  private

  def set_user_plan
    @user_plan = current_user.user_plan
  end

  def user_plan_params
    params.require(:user_plan).permit(:stripe_plan_id, :stripeToken)
  end

  def require_start
    unless current_user.plan.stripe_plan_id.start?
      redirect_to edit_my_user_plan_path, alert: '有料プランにアップしてください'
    end
  end
end
