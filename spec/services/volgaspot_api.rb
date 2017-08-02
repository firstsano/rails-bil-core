require "rails_helper"

RSpec.describe VolgaspotApi, type: :module do
  subject { described_class }

  context "module methods" do
    let(:host) { ENV["volgaspot_api"] }
    it { should be_const_defined(:ROUTES) }

    def vs_response(is_success: true, output: {})
      { success: is_success, data: output }
    end

    describe "::login" do
      let(:arguments) { { login: Faker::Lorem.word, password: Faker::Lorem.word } }
      let(:route) { "/customer-sessions/login" }
      let(:execute_login) { subject.login **arguments }

      def stub_vs_request(output = {})
        stub_request(:put, host + route).to_return body: output.to_json,
          headers: { "Content-Type" => "application/json" }
      end

      it { is_expected.to respond_to(:login) }

      it "should request the route" do
        stub = stub_vs_request vs_response
        execute_login
        expect(stub).to have_been_requested
      end

      context "on bad server response" do
        it "should raise error on unsuccess" do
          stub_vs_request vs_response(is_success: false)
          expect{ execute_login }.to raise_error(Exceptions::RemoteRequestError)
        end

        it "should raise error on empty response" do
          stub_vs_request
          expect{ execute_login }.to raise_error(Exceptions::RemoteRequestError)
        end
      end
    end

    describe "::fetch_user_data" do

    end

    describe "::fetch_user_services" do

    end
  end
end
