RSpec.describe "routes for authentification", type: :routing do
  describe "signing in" do
    let(:path) { "/users/sign-in" }

    it "should be routable" do
      expect(post: path).to be_routable
    end
  end
end
