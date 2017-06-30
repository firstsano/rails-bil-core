RSpec.describe "routes user data", type: :routing do
  let(:namespace) { "api/v1" }

  describe "user detalization" do
    let(:path) { namespace + "/account/discounts" }

    it "should be routable" do
      expect(get: path).to be_routable
    end

    it "should route to specific controller" do
      expect(get: path).to route_to(
        controller: namespace + "/account",
        action: "discounts"
      )
    end
  end
end
