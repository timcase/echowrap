require 'echowrap/error/client_error'

module Echowrap
  class Error
    # Raised when Echowrap returns the HTTP status code 404
    class NotFound < Echowrap::Error::ClientError
      HTTP_STATUS_CODE = 404
    end
  end
end
