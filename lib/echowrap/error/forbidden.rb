require 'echowrap/error/client_error'

module Echowrap
  class Error
    # Raised when Echowrap returns the HTTP status code 403
    class Forbidden < Echowrap::Error::ClientError
      HTTP_STATUS_CODE = 403
    end
  end
end
