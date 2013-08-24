require 'echowrap/error/server_error'

module Echowrap
  class Error
    # Raised when Echowrap returns the HTTP status code 504
    class GatewayTimeout < Echowrap::Error::ServerError
      HTTP_STATUS_CODE = 504
      MESSAGE = "The Echowrap servers are up, but the request couldn't be serviced due to some failure within our stack. Try again later."
    end
  end
end
