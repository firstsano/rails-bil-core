require 'rails_helper'

RSpec.describe "routes user data", type: :routing do
  describe "current user info" do
    it "should be routable" do
      expect(get: "/users/show").to be_routable
    end
  end
end
