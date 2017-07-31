module VolgaspotApiService
  include HTTParty
  base_uri ENV["volgaspot_api"]

  ROUTES = {
    login: "/customer-sessions/login",
    user_data: "/users/"
  }

  def self.login(login:, password:)
    send_request put(ROUTES[:login], body: { login: login, password: password })
  end

  def self.fetch_user_data(id, user)
    data = send_request get(ROUTES[:user_data] + id.to_s, query: { expand: :account })
    data[:vist_account] = data[:account_id]
    user.set_attributes data
    user.utm_account.set_attributes data[:account]
    user
  end

  def self.fetch_user_services(id)
    data = send_request get(ROUTES[:user_data] + id.to_s, query: { expand: :services })
    services = data[:services].values
  end

  def self.load_user_services(id)
    fetched_service_data = fetch_user_services id
    service_datum = ServiceData.where id: fetched_service_data.map { |e| e[:service_id] }
    fetched_service_data.map do |f|
      service = Service.new id: f[:service_id]
      service.service_data = service_datum.find f[:service_id]
      service.set_attributes cost_month: f[:service_cost]
    end
  end

  private

  def self.send_request(request)
    request.parsed_response.with_indifferent_access
    raise Exceptions::RemoteRequestError.new "Remote server couldn't execute request" unless response[:success]
    response[:data]
  end
end
