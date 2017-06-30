RSpec.describe "routes user data", type: :routing do
  let(:current_namespace) { "api/v1" }

  describe "user detalization" do
    it "should be routable" do
      expect(get: namespaced("/account/discounts")).to be_routable
    end

    it "should route to specific controller" do
      expect(get: namespaced("/account/discounts")).to route_to(
        controller: namespaced("/account"),
        action: "discounts"
      )
    end
  end
end
