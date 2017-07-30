require 'rails_helper'

RSpec.describe Service, type: :model do
  clean_before(:all)
  subject { build :service, :with_service_data }
  it { is_expected.to respond_to(:service_data) }
  its(:service_data) { is_expected.to be_an_instance_of(ServiceData) }

  describe "class methods" do
    context "#new" do
      it "should not create service without id specified" do
        expect{ Service.new }.to raise_error(ArgumentError)
      end
    end
  end
end
