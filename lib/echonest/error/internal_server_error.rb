require 'echonest/error/server_error'

module Echonest
  class Error
    # Raised when Echonest returns the HTTP status code 500
    class InternalServerError < Echonest::Error::ServerError
      HTTP_STATUS_CODE = 500
      MESSAGE = "Something is technically wrong."
    end
  end
end
