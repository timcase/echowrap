require 'echonest/default'
require 'echonest/error/configuration_error'
require 'forwardable'

module Echonest
  module Configurable
    extend Forwardable
    attr_writer :api_key, :consumer_key, :shared_secret
    attr_accessor :endpoint, :connection_options, :identity_map, :middleware
    def_delegator :options, :hash

    class << self
      def keys
        @keys ||= [
          :api_key,
          :consumer_key,
          :shared_secret,
          :endpoint,
          :connection_options,
          :identity_map,
          :middleware,
        ]
      end
    end

    # Convenience method to allow configuration options to be set in a block
    #
    # @raise [Echonest::Error::ConfigurationError] Error is raised when supplied
    #   echonest credentials are not a String or Symbol.
    def configure
      yield self
      validate_credential_type!
      self
    end

    # @return [Boolean]
    def credentials?
      credentials.values.all?
    end

    def reset!
      Echonest::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", Echonest::Default.options[key])
      end
      self
    end

    alias setup reset!

  private
    def application_only_auth?
      true
    end

    # @return [Hash]
    def credentials
      {
        :api_key => @api_key,
        :consumer_key => @consumer_key,
        :shared_secret => @shared_secret,
      }
    end

    # @return [Hash]
    def options
      Hash[Echonest::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end

    # Ensures that all credentials set during configuration are of a
    # valid type. Valid types are String and Symbol.
    #
    # @raise [Echonest::Error::ConfigurationError] Error is raised when
    #   supplied echonest credentials are not a String or Symbol.
    def validate_credential_type!
      credentials.each do |credential, value|
        next if value.nil?

        unless value.is_a?(String) || value.is_a?(Symbol)
          raise(Error::ConfigurationError, "Invalid #{credential} specified: #{value} must be a string or symbol.")
        end
      end
    end

  end
end
