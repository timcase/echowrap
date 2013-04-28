require 'echonest/error/client_error'

module Echonest
  class Error
    # Raised when Echonest returns the HTTP status code 404
    class UnprocessableEntity < Echonest::Error::ClientError
      HTTP_STATUS_CODE = 422
    end
  end
end
