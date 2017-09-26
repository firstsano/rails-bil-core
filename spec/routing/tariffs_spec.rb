require 'rails_helper'

RSpec.describe "routes user tariffs information" do
  describe "user current tariff detalization" do
    it "should be routable" do
      expect(get: "/tariffs/index").to be_routable
    end
  end

  describe "user available tariffs to change" do
    it "should be routable" do
      expect(get: "/tariffs/available").to be_routable
    end
  end
end
