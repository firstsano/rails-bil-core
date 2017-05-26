require 'spec_helper'

RSpec.describe "routes for authentification", type: :routing do
  describe "signing in" do
    it "should be routable" do
      expect(post: "/users/sign-in").to be_routable
    end

    it "should route to token controller action" do
      expect(post: "/users/sign-in").to route_to(controller: "user_token", action: "create")
    end
  end
end
