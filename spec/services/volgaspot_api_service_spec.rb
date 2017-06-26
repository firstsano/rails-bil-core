require 'rails_helper'
require 'webmock/rspec'

RSpec.describe "VolgaspotApiService", type: :module do
  subject { VolgaspotApiService }

  it { is_expected.to be_const_defined(:ROUTES) }

  describe "::login" do
    let(:user_attributes) { attributes_for(:user_auth) }
    let(:target_path) { ENV["volgaspot_api"] + "/customer-sessions/login" }

    def stub_json_request(target:, output:)
      stub_request(:put, target).to_return body: output.to_json, headers: { content_type: 'application/json' }
    end

    def login_with_user_attributes(with_output)
      stub_json_request target: target_path, output: with_output
      VolgaspotApiService.login **user_attributes
    end

    it { is_expected.to respond_to(:login) }

    it "should send put request to routes login with params of login and password" do
      login_with_user_attributes with_output: { success: true, data: [] }
      expect(WebMock).to have_requested(:put, target_path).with(body: user_attributes).once
    end

    context "when responded with success" do
      it "should return user data" do
        output = { success: true, data: "custom output" }
        expect(login_with_user_attributes(output)).to eq "custom output"
      end
    end

    context "when responded with failure" do
      it "should return false if success is false" do
        output = { success: false, errors: "custom errors" }
        expect(login_with_user_attributes(output)).to be_falsey
      end

      it "should return false if no data in response" do
        output = { success: true }
        expect(login_with_user_attributes(output)).to be_falsey
      end
    end
  end
end
