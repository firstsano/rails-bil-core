require 'rails_helper'

RSpec.describe "routes to user's promised payments", type: :routing do
  describe "promised payment status" do
    it "should be routable" do
      expect(get: '/promised-payments/show').to be_routable
    end
  end

  describe "use promised payment" do
    it "should be routable" do
      expect(put: '/promised-payments/use').to be_routable
    end
  end
end
