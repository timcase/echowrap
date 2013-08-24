require 'echowrap/error/client_error'

module Echowrap
  class Error
    # Raised when Echowrap returns the HTTP status code 401
    class Unauthorized < Echowrap::Error::ClientError
      HTTP_STATUS_CODE = 401
    end
  end
end
