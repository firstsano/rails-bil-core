require 'rails_helper'

RSpec.describe Utm::Service, type: :model do
  clean_before(:all) { Timecop.freeze }

  it_behaves_like "readonly model"

  let(:periodic_service_types) { [1, 2] }
  let(:periodic_service_type) { periodic_service_types.sample }
  before { stub_const("Utm::Service::PERIODIC_SERVICE_TYPES", periodic_service_types) }

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

    context "#is_periodic_service?" do
      it { is_expected.to respond_to(:is_periodic_service?) }

      context "when service is periodic" do
        subject { create :service, service_type: periodic_service_type }
        it { is_expected.to be_is_periodic_service }
      end

      context "when service is not periodic" do
        subject { create :service, service_type: 124141 }
        it { is_expected.not_to be_is_periodic_service }
      end
    end

    context "#service_data" do
      it { is_expected.to respond_to(:service_data) }

      context "when periodic_service_data is properly set" do
        it "should return PeriodicServiceData instance" do
          service = create :service, service_type: periodic_service_type
          periodic_service_data = create :periodic_service_data, id: service.id
          expect(service.service_data).to eq periodic_service_data
        end
      end

      context "when wrong service type" do
        it "should return nil" do
          service = create :service, service_type: 6
          periodic_service_data = create :periodic_service_data, id: service.id
          expect(service.service_data).to be_nil
        end
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
  end

  describe "class methods" do
    subject { described_class }
    it { should be_const_defined(:PERIODIC_SERVICE_TYPES) }
  end

  after(:all) { Timecop.return }
end
