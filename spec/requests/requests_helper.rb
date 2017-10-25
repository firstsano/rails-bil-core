require "rails_helper"

RSpec.configure do |config|
  config.extend Authentication
  config.include Requests::HeadersHelpers, type: :request
  config.include JsonExpressions, type: :request
end
