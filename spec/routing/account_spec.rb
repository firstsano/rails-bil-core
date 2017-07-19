require 'rails_helper'

RSpec.describe "routes user data", type: :routing do
  describe "user account status" do
    it "should be routable" do
      expect(get: "/account/status").to be_routable
    end
  end

  describe "user discounts detalization" do
    it "should be routable" do
      expect(get: "/account/discounts").to be_routable
    end
  end
end
