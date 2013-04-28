require 'echonest/error/client_error'

module Echonest
  class Error
    # Raised when Echonest returns the HTTP status code 400
    class BadRequest < Echonest::Error::ClientError
      HTTP_STATUS_CODE = 400
    end
  end
end
