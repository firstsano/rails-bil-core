module Authentication
  def sign_in
    before(:all) do
      @user ||= build :user
      @user_token = Knock::AuthToken.new(payload: { sub: @user.id }).token
    end

    before do
      target = ENV["volgaspot_api"] + "/users/#{@user.id}"
      user_response = { user: @user.to_h }
      stub_request(:get, target).to_return body: user_response.to_json
    end

    let(:auth_headers) { { "Authorization": "Bearer #{@user_token}" } }
  end
end
