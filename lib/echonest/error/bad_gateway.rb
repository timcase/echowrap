require 'echonest/error/server_error'

module Echonest
  class Error
    # Raised when Echonest returns the HTTP status code 502
    class BadGateway < Echonest::Error::ServerError
      HTTP_STATUS_CODE = 502
      MESSAGE = "Echonest is down or being upgraded."
    end
  end
end
