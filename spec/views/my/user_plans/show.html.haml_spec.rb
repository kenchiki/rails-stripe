require 'rails_helper'

RSpec.describe "my/user_plans/show", type: :view do
  before(:each) do
    @my_user_plan = assign(:my_user_plan, UserPlan.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
