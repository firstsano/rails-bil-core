require 'rails_helper'

RSpec.describe Utm::Discount, type: :model do
  it_behaves_like "model with within_range method", :discount_date
end
