require 'rails_helper'

RSpec.describe "routes user payments", type: :routing do
  describe "user payments detalization" do
    it "should be routable" do
      expect(get: "/payments/index").to be_routable
    end
  end
end
