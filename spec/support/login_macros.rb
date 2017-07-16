module Authentication
  def setup_auth
    before(:all) do
      @user ||= build :user
      @user_token = Knock::AuthToken.new(payload: { sub: @user.id }).token
    end

    before do
      target = ENV["volgaspot_api"] + "/users/#{@user.id}"
      user_response = { success: true, data: @user.to_h }.to_json
      stub_request(:get, target).to_return body: user_response,
        headers: { "Content-Type" => "application/json" }
    end

    let(:auth_headers) {
      {
        "HTTP_ACCEPT" => "application/json",
        "Authorization": "Bearer #{@user_token}"
      }
    }
  end
end
