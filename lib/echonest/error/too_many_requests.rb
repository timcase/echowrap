require 'echonest/error/client_error'

module Echonest
  class Error
    # Raised when Echonest returns the HTTP status code 429
    class TooManyRequests < Echonest::Error::ClientError
      HTTP_STATUS_CODE = 429
    end
    EnhanceYourCalm = TooManyRequests
    RateLimited = TooManyRequests
  end
end
