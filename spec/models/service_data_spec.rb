require 'rails_helper'

RSpec.describe ServiceData, type: :model do
  clean_before
  it { is_expected.to be_readonly }
  it { is_expected.to respond_to(:name) }

  describe "instance methods" do
    context "::parent" do
      subject { create :service_data, :with_parent }
      it { is_expected.to respond_to(:parent) }
      its(:parent) { is_expected.to be_an_instance_of(ServiceData) }
    end

    context "::service_type_name" do
      it { is_expected.to respond_to(:service_type_name) }
      context "when parent exists" do
        subject { create :service_data, :with_parent }
        its(:service_type_name) { is_expected.to eq subject.parent.name }
      end

      context "when parent does not exist" do
        subject { create :service_data }
        its(:service_type_name) { is_expected.to be_nil }
      end
    end
  end
end
