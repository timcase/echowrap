require 'echonest/error/client_error'

module Echonest
  class Error
    # Raised when Echonest returns the HTTP status code 404
    class NotFound < Echonest::Error::ClientError
      HTTP_STATUS_CODE = 404
    end
  end
end
