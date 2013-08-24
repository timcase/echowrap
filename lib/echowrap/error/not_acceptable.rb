require 'echowrap/error/client_error'

module Echowrap
  class Error
    # Raised when Echowrap returns the HTTP status code 406
    class NotAcceptable < Echowrap::Error::ClientError
      HTTP_STATUS_CODE = 406
    end
  end
end
