module VolgaspotApiService
  include HTTParty
  base_uri ENV["volgaspot_api"]

  ROUTES = {
    login: "/customer-sessions/login"
  }

  def self.login(login:, password:)
    raw_response = put ROUTES[:login], body: { login: login, password: password }
    response = raw_response.parsed_response.with_indifferent_access
    return false unless response[:success]
    response[:data]
  end
end
