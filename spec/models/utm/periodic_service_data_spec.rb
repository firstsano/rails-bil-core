require "rails_helper"

RSpec.describe Utm::PeriodicServiceData, type: :model do
  it_behaves_like "readonly model"

  describe "instance methods" do
    context "#cost_month" do
      it { is_expected.to respond_to(:cost_month) }
      its(:cost) { is_expected.to eq subject.cost_month }
    end

    context "#cost_day" do
      it { is_expected.to respond_to(:cost_day) }

      it "should calculate cost_day based on cost_month" do
        periodic_service_data = create :periodic_service_data, cost: 1000
        expectable_cost = (1000.0 / Time.days_in_month(Date.current.month)).round 2
        expect(periodic_service_data.cost_day).to eq expectable_cost
      end
    end
  end
end
