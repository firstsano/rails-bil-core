module Authentication
  def setup_auth
    before(:all) do
      @user_response ||= build :vs_response, :user
      @user ||= User.new.set_attributes @user_response[:data]
      @user.utm_account = @user_response[:data][:account][:id]
      @user_token = Knock::AuthToken.new(payload: { sub: @user.id }).token
    end

    before do
      target = ENV["volgaspot_api"] + "/users/#{@user.id}?expand=account"
      stub_request(:get, target).to_return body: @user_response.to_json,
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
