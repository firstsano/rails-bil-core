require 'rails_helper'

RSpec.describe Utm::Payment, type: :model do
  it { is_expected.to be_readonly }

  describe "instance methods" do
    context "#payment_method" do
      subject { build :payment, :with_payment_method }
      it { is_expected.to respond_to(:payment_method) }
      its(:payment_method) { is_expected.to be_an_instance_of(Utm::PaymentMethod) }
    end
  end
end
