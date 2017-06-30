RSpec.describe "Api::V1::AccountController", type: :request do
  let(:namespace) { "api/v1" }

  describe "GET discounts" do
    let(:route) { namespace + "/account/discounts" }

    context "when user is not authorized" do
      it "should return not_authorized header"
    end

    it "should return ok header on success"

    it "should return corresponding data in response"
  end
end
