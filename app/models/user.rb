class User < ActiveResource::Base
  self.site = ENV["volgaspot_api"] + "/users"
end
