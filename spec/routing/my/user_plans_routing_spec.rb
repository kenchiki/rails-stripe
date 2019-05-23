require "rails_helper"

RSpec.describe My::UserPlansController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/my/user_plans").to route_to("my/user_plans#index")
    end

    it "routes to #new" do
      expect(:get => "/my/user_plans/new").to route_to("my/user_plans#new")
    end

    it "routes to #show" do
      expect(:get => "/my/user_plans/1").to route_to("my/user_plans#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/my/user_plans/1/edit").to route_to("my/user_plans#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/my/user_plans").to route_to("my/user_plans#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/my/user_plans/1").to route_to("my/user_plans#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/my/user_plans/1").to route_to("my/user_plans#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/my/user_plans/1").to route_to("my/user_plans#destroy", :id => "1")
    end
  end
end
