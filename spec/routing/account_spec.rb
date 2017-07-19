require 'rails_helper'

RSpec.describe "routes user data", type: :routing do
  describe "user detalization" do
    let(:path) { "/account/discounts" }

    it "should be routable" do
      expect(get: path).to be_routable
    end
  end
end
