module V1
  class UserTokenController < ::Knock::AuthTokenController
    include ::ExceptionsHandler
  end
end
