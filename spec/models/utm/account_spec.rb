require 'rails_helper'

RSpec.describe Utm::Account, type: :model do
  it { is_expected.to respond_to(:internet_status) }
end
