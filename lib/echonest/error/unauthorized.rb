require 'echonest/error/client_error'

module Echonest
  class Error
    # Raised when Echonest returns the HTTP status code 401
    class Unauthorized < Echonest::Error::ClientError
      HTTP_STATUS_CODE = 401
    end
  end
end
