require 'rails_helper'

RSpec.describe "my/user_plans/edit", type: :view do
  before(:each) do
    @my_user_plan = assign(:my_user_plan, UserPlan.create!())
  end

  it "renders the edit my_user_plan form" do
    render

    assert_select "form[action=?][method=?]", my_user_plan_path(@my_user_plan), "post" do
    end
  end
end
