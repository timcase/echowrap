require 'echonest/error/client_error'

module Echonest
  class Error
    # Raised when Echonest returns the HTTP status code 406
    class NotAcceptable < Echonest::Error::ClientError
      HTTP_STATUS_CODE = 406
    end
  end
end
