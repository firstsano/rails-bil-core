require 'rails_helper'

RSpec.describe Utm::ServiceData, type: :model do
  clean_before(:all) { Timecop.freeze }

  it_behaves_like "readonly model"

  let(:periodic_service_types) { [1, 2] }
  let(:periodic_service_type) { periodic_service_types.sample }
  before { stub_const("Utm::Service::PERIODIC_SERVICE_TYPES", periodic_service_types) }

  describe "instance methods" do
    subject { create :service_data }
    let(:service) { subject }

    context "#type_of_service" do
      it { is_expected.to respond_to(:type_of_service) }

      context "when parent exists" do
        subject { create :service_data, :with_parent }
        its(:type_of_service) { is_expected.to eq subject.parent.name }
      end

      context "when parent does not exist" do
        its(:type_of_service) { is_expected.to be_nil }
      end
    end

    context "#parent" do
      subject { create :service_data, :with_parent }

      it { is_expected.to respond_to(:parent) }
      its(:parent) { is_expected.to be_an_instance_of described_class }
    end

    context "#name" do
      it { is_expected.to respond_to(:name) }
    end
  end

  after(:all) { Timecop.return }
end
