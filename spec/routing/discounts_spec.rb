require 'rails_helper'

RSpec.describe "routes user data", type: :routing do
  describe "user discounts detalization" do
    it "should be routable" do
      expect(get: "/discounts/index").to be_routable
    end
  end
end
