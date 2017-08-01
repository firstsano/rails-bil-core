require 'rails_helper'

RSpec.describe Utm::Service, type: :model do
  clean_before(:all) { Timecop.freeze }

  it { is_expected.to be_readonly }

  describe "instance methods" do
    subject { build :service }
    let(:service) { subject }

    context "#service_type_name" do
      it { is_expected.to respond_to(:service_type_name) }

      context "when parent exists" do
        subject { create :service, :with_parent }
        its(:service_type_name) { is_expected.to eq subject.parent.name }
      end

      context "when parent does not exist" do
        subject { create :service }
        its(:service_type_name) { is_expected.to be_nil }
      end
    end

    context "#parent" do
      subject { create :service, :with_parent }
      it { is_expected.to respond_to(:parent) }
      its(:parent) { is_expected.to be_an_instance_of described_class }
    end

    context "#name" do
      it { is_expected.to respond_to(:name) }
    end

    context "#cost_day" do
      it { is_expected.to respond_to(:cost_day) }

      context "when cost_month is set" do
        it "should calculate cost_day based on cost_month" do
          service.cost_month = 1000.0
          expectable_cost = (1000.0 / Time.days_in_month(Date.current.month)).round 2
          expect(service.cost_day).to eq expectable_cost
        end
      end

      context "when cost_month is not set" do
        its(:cost_day) { is_expected.to eq 0 }
      end
    end
  end

  after(:all) { Timecop.return }
end
