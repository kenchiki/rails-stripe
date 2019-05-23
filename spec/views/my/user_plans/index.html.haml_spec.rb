require 'rails_helper'

RSpec.describe "my/user_plans/index", type: :view do
  before(:each) do
    assign(:user_plans, [
      UserPlan.create!(),
      UserPlan.create!()
    ])
  end

  it "renders a list of my/user_plans" do
    render
  end
end
