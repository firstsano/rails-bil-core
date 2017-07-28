require 'rails_helper'

RSpec.describe Service, type: :model do
  clean_before(:all)
  it { is_expected.to be_readonly }
  it { is_expected.to respond_to(:name) }

  describe "instance methods" do
    context "::parent" do
      subject { create :service, :with_parent }
      it { is_expected.to respond_to(:parent) }
      its(:parent) { is_expected.to be_an_instance_of(Service) }
    end
  end
end
