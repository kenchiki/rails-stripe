require 'rails_helper'

RSpec.describe "My::UserPlans", type: :request do
  describe "GET /my/user_plans" do
    it "works! (now write some real specs)" do
      get my_user_plans_path
      expect(response).to have_http_status(200)
    end
  end
end
