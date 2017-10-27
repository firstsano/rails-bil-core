require "rails_helper"

module JsonPattern
  extend JsonExpressionsMacros::RubyAttributesSpec
end

RSpec.configure do |config|
  config.extend Authentication
  config.include Requests::HeadersHelpers
end
