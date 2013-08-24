require 'echowrap/error/client_error'

module Echowrap
  class Error
    # Raised when Echowrap returns the HTTP status code 404
    class UnprocessableEntity < Echowrap::Error::ClientError
      HTTP_STATUS_CODE = 422
    end
  end
end
