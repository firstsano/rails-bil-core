require "rails_helper"

RSpec.describe Utm::Tariff, type: :model do
  describe "instance methods" do
    context "#periodic_services" do
      it { is_expected.to respond_to(:periodic_services) }
    end
  end
end
