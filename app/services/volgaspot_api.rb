module VolgaspotApi
  include HTTParty
  base_uri ENV["volgaspot_api"]

  ROUTES = {
    login: "/customer-sessions/login",
    user_data: "/users/user_id?expand=account",
    user_services: "/users/user_id?expand=services"
  }

  def self.login(login:, password:)
    get_response put(route(:login), body: { login: login, password: password })
  end

  def self.fetch_user_data(id, user)
    data = get_response get(route(:user_data, user_id: id))
    ApiDataTranformer.transform_user_data data
    user.set_attributes data
    user.utm_account.set_attributes data[:account]
    user
  end

  def self.fetch_user_services(id)
    data = get_response get(route(:user_services, user_id: id))
    ApiDataTranformer.transform_services_data data
  end

  private

  def self.route(name, params = {})
    route = ROUTES[name].clone
    params.each { |k, v| route.gsub! k.to_s, v.to_s }
    route
  end

  def self.get_response(request)
    response = request.parsed_response.with_indifferent_access
    raise Exceptions::RemoteRequestError.new "Remote server couldn't execute request" unless response[:success]
    response[:data]
  end

  module ApiDataTranformer
    def self.transform_user_data(data)
      data[:vist_account] = data[:account_id]
    end

    def self.transform_services_data(data)
      data[:services].values.index_by { |service| service[:service_id] }
    end
  end
end
