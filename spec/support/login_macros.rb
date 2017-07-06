module Authentication
  def sign_in
    before do
      @user ||= build :user
      @user_token = Knock::AuthToken.new(payload: { sub: @user[:id] }).token
      target = ENV["volgaspot_api"] + "/users/#{@user[:id]}"
      stub_request(:get, target).to_return body: @user.to_json
    end

    let(:auth_headers) { { "Authorization": "Bearer #{@user_token}" } }
  end
end
