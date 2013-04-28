require 'echonest/error/server_error'

module Echonest
  class Error
    # Raised when Echonest returns the HTTP status code 504
    class GatewayTimeout < Echonest::Error::ServerError
      HTTP_STATUS_CODE = 504
      MESSAGE = "The Echonest servers are up, but the request couldn't be serviced due to some failure within our stack. Try again later."
    end
  end
end
