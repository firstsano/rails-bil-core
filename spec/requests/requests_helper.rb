require "rails_helper"

module JsonPattern
  extend JsonExpressions::JsonSpec
end

RSpec.configure do |config|
  config.extend Authentication
  config.include Requests::HeadersHelpers
end
