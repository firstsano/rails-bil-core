require "rails_helper"

RSpec.describe Utm::PeriodicService, type: :model do
  describe "instance methods" do
    subject { create :periodic_service }

    context "#tariffs" do
      it { is_expected.to respond_to(:tariffs) }
    end

    context "#cost_month" do
      it { is_expected.to respond_to(:cost_month) }
      its(:cost) { is_expected.to eq subject.cost_month }
    end

    context "#cost_day" do
      it { is_expected.to respond_to(:cost_day) }

      it "should calculate cost_day based on cost_month" do
        periodic_service_data = create :periodic_service, cost: 1000
        expectable_cost = (1000.0 / Time.days_in_month(Date.current.month)).round 2
        expect(periodic_service_data.cost_day).to eq expectable_cost
      end
    end

    context "#service_data" do
      it { is_expected.to respond_to(:service_data) }
      its(:service_data) { is_expected.to be_an_instance_of Utm::ServiceData }
    end
  end

  describe "class methods" do
    subject { described_class }
    it { should be_const_defined(:SERVICE_TYPES) }
  end
end
