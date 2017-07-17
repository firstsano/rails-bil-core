module Authentication
  def setup_auth
    before(:all) do
      @user_fetch_response ||= build :vs_response, :user
      @user ||= User.new @user_fetch_response[:data]
      @user.utm_account = @user_fetch_response[:data][:account][:id]
      @user_token = Knock::AuthToken.new(payload: { sub: @user.id }).token
    end

    before do
      target = ENV["volgaspot_api"] + "/users/#{@user.id}?expand=account"
      user_response = @user_fetch_response.to_json
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
