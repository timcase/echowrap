require 'echowrap/error/server_error'

module Echowrap
  class Error
    # Raised when Echowrap returns the HTTP status code 500
    class InternalServerError < Echowrap::Error::ServerError
      HTTP_STATUS_CODE = 500
      MESSAGE = "Something is technically wrong."
    end
  end
end
