require 'rails_helper'

RSpec.describe "my/user_plans/new", type: :view do
  before(:each) do
    assign(:my_user_plan, UserPlan.new())
  end

  it "renders new my_user_plan form" do
    render

    assert_select "form[action=?][method=?]", my_user_plans_path, "post" do
    end
  end
end
