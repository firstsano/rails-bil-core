require "rails_helper"

RSpec.describe Utm::Tariff, type: :model do
  it_behaves_like "readonly model"

  describe "instance methods" do
    context "#periodic_services" do
      it { is_expected.to respond_to(:periodic_services) }
    end
  end
end
