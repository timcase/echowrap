require 'echowrap/error/client_error'

module Echowrap
  class Error
    # Raised when Echowrap returns the HTTP status code 400
    class BadRequest < Echowrap::Error::ClientError
      HTTP_STATUS_CODE = 400
    end
  end
end
