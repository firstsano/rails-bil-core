require "rails_helper"

RSpec.describe Utm::Tariff, type: :model do
  it_behaves_like "readonly model"

  it { is_expected.to respond_to(:periodic_services) }
end
