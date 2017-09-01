require 'rails_helper'

RSpec.describe Utm::Payment, type: :model do
  it_behaves_like "readonly model"
  it_behaves_like "model with within_range method", :payment_enter_date

  describe "instance methods" do
    context "#payment_method" do
      subject { create :payment, :with_payment_method }
      it { is_expected.to respond_to(:payment_method) }
      its(:payment_method) { is_expected.to be_an_instance_of(Utm::PaymentMethod) }
    end
  end
end
