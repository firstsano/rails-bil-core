require "rails_helper"

module JsonPattern
  extend JsonExpressionsMacros::JsonSpec
end

RSpec.configure do |config|
  config.extend Authentication
  config.include Requests::HeadersHelpers
end
