require "rails_helper"

RSpec.describe Utm::PeriodicServiceData, type: :model do
  it_behaves_like "readonly model"

  describe "instance methods" do
    context "#cost_month" do
      it { is_expected.to respond_to(:cost_month) }
      its(:cost) { is_expected.to eq subject.cost_month }
    end
  end
end
