module Authentication
  def setup_auth
    before(:all) do
      @user ||= build :user, :without_remote_calls
      @user_token = Knock::AuthToken.new(payload: { sub: @user.id }).token
    end

    before { allow(User).to receive(:find).with(@user.id).and_return @user }

    let(:auth_headers) {
      {
        "HTTP_ACCEPT" => "application/json",
        "Authorization": "Bearer #{@user_token}"
      }
    }
  end
end
