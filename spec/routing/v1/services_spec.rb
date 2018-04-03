require 'rails_helper'

RSpec.describe "routes user services" do
  describe "user services detalization" do
    it "should be routable" do
      expect(get: "/services/index").to be_routable
    end
  end
end
