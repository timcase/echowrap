require 'echonest/error/server_error'

module Echonest
  class Error
    # Raised when Echonest returns the HTTP status code 503
    class ServiceUnavailable < Echonest::Error::ServerError
      HTTP_STATUS_CODE = 503
      MESSAGE = "(__-){ Echonest is over capacity."
    end
  end
end
