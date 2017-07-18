module VolgaspotApiService
  include HTTParty
  base_uri ENV["volgaspot_api"]

  ROUTES = {
    login: "/customer-sessions/login",
    user_data: "/users/"
  }

  def self.login(login:, password:)
    response = send_request put(ROUTES[:login], body: { login: login, password: password })
    return false unless response[:success]
    response[:data]
  end

  def self.fetch_user_data(id)
    response = send_request get(ROUTES[:user_data] + id.to_s, query: { expand: :account })
    return false unless response[:success]
    response[:data][:vist_account] = response[:data][:account_id]
    response[:data][:utm_account] = response[:data][:account][:id]
    response[:data]
  end

  private

  def self.send_request(request)
    request.parsed_response.with_indifferent_access
  end
end
