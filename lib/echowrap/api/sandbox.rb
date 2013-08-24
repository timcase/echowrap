require 'echowrap/api/utils'

module Echowrap
  module API
    module Sandbox
      include Echowrap::API::Utils

      # Lists detailed information about each asset in the sandbox. This method describes each asset in detail but does not provide direct access to the assets. This method does not require an approved API key. Note that different sandboxes may return different sets of data and metadata.
      #
      # @see http://developer.echonest.com/docs/v4/sandbox.html#list
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echowrap::Sandbox] The sandbox
      # @param options [Hash] A customizable set of options.
      # @option options [String] :sandbox The name of the sandbox. Required.  Example: 'emi_evanescence'.
      # @option options [Integer] :results The number of results desired. Not required, defaults to 15, must be between 0 and 100.
      # @option options [Integer] :start The desired index of the first result returned. Not required, defaults to 0, must be one of [0, 15, 30].
      #
      # @example sandbox_list
      #   Echowrap.sandbox_list(:sandbox => 'emi_evanescence')
      def sandbox_list(options={})
        object_from_response(Echowrap::Sandbox, :get, '/api/v4/sandbox/list', nil, options)
      end

      # Gets access to the listed assets. This method returns a secure token or URL that can be used by the application to access the asset. This method requires an API key that has been approved for the sandbox.
      # NOTE: This method uses Oauth, the oauth parameters are generated and inserted by this gem automatically and do not need to be manually added.
      #
      # @see http://developer.echonest.com/docs/v4/sandbox.html#access
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echowrap::Sandbox] The sandbox
      # @param options [Hash] A customizable set of options.
      # @option options [String] :sandbox The name of the sandbox. Required.  Example: 'emi_evanescence'.
      # @option options [String] :The ID of the asset. Required, may send multiple. Example: 'c1b89c9b9e0ee9e53650f1d4e393d716'.
      #
      # @example sandbox_access
      #   Echowrap.sandbox_access(:sandbox => 'emi_evanescence', :id => 'c1b89c9b9e0ee9e53650f1d4e393d716')
      def sandbox_access(options={})
        objects_from_response(Echowrap::Asset, :get, '/api/v4/sandbox/access', :assets, options.merge(:oauth_request => true))
      end
    end
  end
end
