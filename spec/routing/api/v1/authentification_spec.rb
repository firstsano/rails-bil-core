RSpec.describe "routes for authentification", type: :routing do
  let(:current_namespace) { "api/v1" }

  describe "signing in" do
    it "should be routable" do
      expect(post: namespaced("/users/sign-in")).to be_routable
    end

    it "should route to token controller action" do
      expect(post: namespaced("/users/sign-in")).to route_to(
        controller: namespaced("/user_token"),
        action: "create"
      )
    end
  end
end
