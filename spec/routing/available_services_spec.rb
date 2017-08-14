require "rails_helper"

RSpec.describe "routes user available services" do
  describe "list of available services" do
    it "should be routable" do
      expect(get: "/available-services/index").to be_routable
    end
  end
end
