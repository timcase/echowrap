require 'echowrap/error/server_error'

module Echowrap
  class Error
    # Raised when Echowrap returns the HTTP status code 502
    class BadGateway < Echowrap::Error::ServerError
      HTTP_STATUS_CODE = 502
      MESSAGE = "Echowrap is down or being upgraded."
    end
  end
end
