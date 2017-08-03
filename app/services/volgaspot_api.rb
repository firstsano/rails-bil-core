module VolgaspotApi
  include HTTParty
  base_uri ENV["volgaspot_api"]

  ROUTES = {
    login: "/customer-sessions/login",
    user_data: "/users/user_id",
    user_account: "/users/user_id?expand=account",
    user_services: "/users/user_id?expand=services"
  }

  def self.login(login:, password:)
    parse_response put(route(:login), body: { login: login, password: password })
  end

  def self.fetch_user_data(id, user)
    route = get_route :user_data, user_id: id
    parse_response get(route), with_transform: :user_data
  end

  def self.fetch_user_utm_account(id)
    route = get_route :user_account, user_id: id
    data = parse_response get(route), with_transform: :user_data
    data[:utm_account_id]
  end

  def self.fetch_user_services(id)
    route = get_route :user_services, user_id: id
    data = parse_response get(route), with_transform: :services_data
    data.keys
  end

  private

  def self.get_route(name, params = {})
    route = ROUTES[name].clone
    params.each { |k, v| route.gsub! k.to_s, v.to_s }
    route
  end

  def self.parse_response(request, with_transform: false)
    response = request.parsed_response.with_indifferent_access
    raise Exceptions::RemoteRequestError.new "Remote server couldn't execute request" unless response[:success]
    ApiDataTransformer.send("transform_#{with_transform}", response[:data]) if with_transform
    response[:data]
  end

  module ApiDataTransformer
    def self.transform_user_data(data)
      data[:vist_account] = data[:account_id]
      data[:utm_account_id] = data[:account][:id]
    end

    def self.transform_services_data(data)
      data[:services].values.index_by { |service| service[:service_id] }
    end
  end
end
