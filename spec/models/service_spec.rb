require 'rails_helper'

RSpec.describe Service, type: :model do
  clean_before(:all) { Timecop.freeze }

  describe "instance methods" do
    context "#service_data" do
      subject { build :service, :with_service_data }
      it { is_expected.to respond_to(:service_data) }
      its(:service_data) { is_expected.to be_an_instance_of(ServiceData) }
    end

    context "#cost_day" do
      subject { build :service }
      let(:service) { subject }

      it { is_expected.to respond_to(:cost_day) }

      context "when cost_month is set" do
        it "should calculate cost_day based on cost_month" do
          service.cost_month = 1000.0
          expectable_cost = 1000.0 / Time.days_in_month(Date.current.month)
          expect(service.cost_day).to eq expectable_cost
        end
      end

      context "when cost_month is not set" do
        its(:cost_month) { is_expected.to be_nil }
      end
    end
  end

  describe "class methods" do
    subject { described_class }

    context "::new" do
      it "should not create service without id specified" do
        expect{ Service.new }.to raise_error(ArgumentError)
      end
    end
  end

  after(:all) { Timecop.return }
end
