RSpec.describe "routes for authentification", type: :routing do
  let(:namespace) { "api/v1" }

  describe "signing in" do
    let(:path) { namespace + "/users/sign-in" }

    it "should be routable" do
      expect(post: path).to be_routable
    end

    it "should route to token controller action" do
      expect(post: path).to route_to(
        controller: namespace + "/user_token",
        action: "create"
      )
    end
  end
end
