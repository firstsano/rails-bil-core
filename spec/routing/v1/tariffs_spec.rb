require 'rails_helper'

RSpec.describe "routes user tariffs information" do
  subject(:tariff) { create :tariff }

  describe "user current tariff detalization" do
    it "should be routable" do
      expect(get: "/tariffs").to be_routable
    end
  end

  describe "user connect tariff" do
    it "should be routable" do
      expect(post: "/tariffs").to be_routable
    end
  end

  describe "user disconnect tariff" do
    it "should be routable" do
      expect(delete: "tariffs/#{tariff.id}").to be_routable
    end
  end

  describe "user change tariff" do
    it "should be routable" do
      expect(put: "tariffs/#{tariff.id}").to be_routable
    end
  end

  describe "user available tariffs to change" do
    it "should be routable" do
      expect(get: "/tariffs/available").to be_routable
    end
  end
end
