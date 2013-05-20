require 'echonest/api/utils'

module Echonest
  module API
    module Sandbox
      include Echonest::API::Utils

      # Lists detailed information about each asset in the sandbox. This method describes each asset in detail but does not provide direct access to the assets. This method does not require an approved API key. Note that different sandboxes may return different sets of data and metadata.
      #
      # @see http://developer.echonest.com/docs/v4/sandbox.html#list
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echonest::Sandbox] The sandbox
      # @param options [Hash] A customizable set of options.
      # @option options [String] :sandbox The name of the sandbox. Required.  Example: 'emi_evanescence'.
      # @option options [Integer] :results The number of results desired. Not required, defaults to 15, must be between 0 and 100.
      # @option options [Integer] :start The desired index of the first result returned. Not required, defaults to 0, must be one of [0, 15, 30].
      #
      # @example sandbox_list
      #   Echonest.sandbox_list(:sandbox => 'emi_evanescence')
      def sandbox_list(options={})
        response = send(:get, '/api/v4/sandbox/list', options)
        Echonest::Sandbox.fetch_or_new(response[:body][:response])
      end
    end
  end
end
