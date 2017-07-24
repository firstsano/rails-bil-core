require 'rails_helper'

RSpec.describe V1::PaymentsController, type: :request do
  before { User.remote_data_service = VolgaspotApiService }
  setup_auth

  describe "GET payments" do
  end
end
