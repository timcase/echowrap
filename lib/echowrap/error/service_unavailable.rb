require 'echowrap/error/server_error'

module Echowrap
  class Error
    # Raised when Echowrap returns the HTTP status code 503
    class ServiceUnavailable < Echowrap::Error::ServerError
      HTTP_STATUS_CODE = 503
      MESSAGE = "(__-){ Echowrap is over capacity."
    end
  end
end
