require 'echonest/error/client_error'

module Echonest
  class Error
    # Raised when Echonest returns the HTTP status code 403
    class Forbidden < Echonest::Error::ClientError
      HTTP_STATUS_CODE = 403
    end
  end
end
