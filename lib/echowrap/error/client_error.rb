require 'echowrap/error'

module Echowrap
  class Error
    # Raised when Echowrap returns a 4xx HTTP status code or there's an error in Faraday
    class ClientError < Echowrap::Error

      # Create a new error from an HTTP environment
      #
      # @param response [Hash]
      # @return [Echowrap::Error]
      def self.from_response(response={})
        new(parse_error(response[:body]), response[:response_headers])
      end

    private

      def self.parse_error(body)
        body[:response][:status][:message]
      end

    end
  end
end
