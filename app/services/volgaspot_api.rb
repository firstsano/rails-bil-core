module VolgaspotApi
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
    services = data[:services].values.index_by { |service| service[:service_id] }
  end

  def self.load_user_services(id)
    fetched_service_data = fetch_user_services id
    services = Service.where(id: fetched_service_data.keys).all
    services.map do |service|
      service.cost_month = fetched_service_data[service.id][:service_cost]
      service
    end
  end

  private

  def self.send_request(request)
    response = request.parsed_response.with_indifferent_access
    raise Exceptions::RemoteRequestError.new "Remote server couldn't execute request" unless response[:success]
    response[:data]
  end
end
