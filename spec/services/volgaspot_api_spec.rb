require "rails_helper"

RSpec.shared_examples "rising error on bad responses" do
  context "on bad server response" do
    it "should raise error on failure" do
      stub_vs_request vs_response(is_success: false)
      expect{ send_method }.to raise_error(Exceptions::RemoteRequestError)
    end

    it "should raise error on empty response" do
      stub_vs_request {}
      expect{ send_method }.to raise_error(Exceptions::RemoteRequestError)
    end
  end
end

RSpec.shared_examples "sending request to proper routes" do |output|
  it "should send request to the route" do
    stub = stub_vs_request vs_response(output: output)
    send_method
    expect(stub).to have_been_requested
  end
end

RSpec.describe VolgaspotApi, type: :module do
  subject { described_class }

  context "module methods" do
    let(:host) { ENV["volgaspot_api"] }
    let(:user) { build :user, :without_remote_calls }

    def stub_vs_request(output = {})
      stub_request(method, host + route).to_return body: output.to_json,
        headers: { "Content-Type" => "application/json" }
    end

    def vs_response(is_success: true, output: {})
      { success: is_success, data: output }
    end

    describe "::login" do
      let(:method) { :put }
      let(:route) { "/customer-sessions/login" }
      let(:send_method) { subject.login login: Faker::Lorem.word, password: Faker::Lorem.word }

      it { is_expected.to respond_to(:login) }
      it_behaves_like "sending request to proper routes", {}
      it_behaves_like "rising error on bad responses"
    end

    describe "::fetch_user_data" do
      let(:method) { :get }
      let(:route) { "/users/#{user.id}" }
      let(:send_method) { subject.fetch_user_data user.id }

      it { is_expected.to respond_to(:fetch_user_data) }
      it_behaves_like "sending request to proper routes", { id: 1515, login: "vs0354", account_id: 293826 }
      it_behaves_like "rising error on bad responses"
    end

    describe "::fetch_user_utm_account" do
      let(:method) { :get }
      let(:route) { "/users/#{user.id}?expand=account" }
      let(:send_method) { subject.fetch_user_utm_account user.id }

      it { is_expected.to respond_to(:fetch_user_utm_account) }
      it_behaves_like "sending request to proper routes", { id: 1515, login: "vs0354", account: { id: 781 } }
      it_behaves_like "rising error on bad responses"

      it "should return only account id" do
        stub_vs_request vs_response(output: { id: 1515, login: "vs0354", account: { id: 781 } })
        expect(send_method).to eq 781
      end
    end

    describe "::fetch_user_services" do
      let(:method) { :get }
      let(:route) { "/users/#{user.id}?expand=services" }
      let(:send_method) { subject.fetch_user_services user.id }

      it { is_expected.to respond_to(:fetch_user_services) }
      it_behaves_like "sending request to proper routes", { services: { "1" => { service_id: 1 }, "2" => { service_id: 2 } } }
      it_behaves_like "rising error on bad responses"

      it "should return array of service_id" do
        stub_vs_request vs_response(output: { services: { "12" => { service_id: 1 }, "32" => { service_id: 2 } } })
        expect(send_method).to eq [1, 2]
      end
    end

    describe "::fetch_user_promised_payment_status" do
      let(:method) { :get }
      let(:route) { "/users/#{user.id}/promised-payment-status" }
      let(:send_method) { subject.fetch_user_promised_payment_status user.id }

      it  { is_expected.to respond_to(:fetch_user_promised_payment_status) }
      it_behaves_like "sending request to proper routes", { available: true }
      it_behaves_like "rising error on bad responses"
    end

    describe "::use_promised_payment" do
      let(:method) { :put }
      let(:route) { "/users/#{user.id}/use-promised-payment" }
      let(:send_method) { subject.use_promised_payment user.id }

      it  { is_expected.to respond_to(:use_promised_payment) }
      it_behaves_like "sending request to proper routes", { data: true }
      it_behaves_like "rising error on bad responses"
    end
  end
end
