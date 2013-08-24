require 'faraday'
require 'faraday/request/multipart'
require 'echowrap/configurable'
require 'echowrap/error/client_error'
require 'echowrap/error/server_error'
require 'echowrap/request/multipart_with_file'
require 'echowrap/response/parse_json'
require 'echowrap/response/raise_error'
 require 'echowrap/version'

module Echowrap
  module Default
    ENDPOINT = 'http://developer.echonest.com' unless defined? Echowrap::Default::ENDPOINT
    CONNECTION_OPTIONS = {
      :headers => {
        :accept => 'application/json',
        :user_agent => "Echowrap Ruby Gem #{Echowrap::Version}",
      },
      :request => {
        :open_timeout => 5,
        :timeout => 10,
        :params_encoder => Faraday::FlatParamsEncoder
      },
      :ssl => {
        :verify => false
      },
    } unless defined? Echnoest::Default::CONNECTION_OPTIONS
    IDENTITY_MAP = false unless defined? Echowrap::Default::IDENTITY_MAP
    MIDDLEWARE = Faraday::RackBuilder.new do |builder|
      # Convert file uploads to Faraday::UploadIO objects
      builder.use Echowrap::Request::MultipartWithFile
      # Checks for files in the payload
      builder.use Faraday::Request::Multipart
      # Convert request params to "www-form-urlencoded"
      builder.use Faraday::Request::UrlEncoded
      # Handle 4xx server responses
      builder.use Echowrap::Response::RaiseError, Echowrap::Error::ClientError
      # Parse JSON response bodies using MultiJson
      builder.use Echowrap::Response::ParseJson
      # Handle 5xx server responses
      builder.use Echowrap::Response::RaiseError, Echowrap::Error::ServerError
      # Set Faraday's HTTP adapter
      builder.adapter Faraday.default_adapter
    end unless defined? Echowrap::Default::MIDDLEWARE

    class << self

      # @return [Hash]
      def options
        Hash[Echowrap::Configurable.keys.map{|key| [key, send(key)]}]
      end

      # @return [String]
      def api_key
        ENV['ECHONEST_API_KEY']
      end

      # @return [String]
      def consumer_key
        ENV['ECHONEST_CONSUMER_KEY']
      end

      # @return [String]
      def shared_secret
        ENV['ECHONEST_SHARED_SECRET']
      end

      # @note This is configurable in case you want to use a Echowrap-compatible endpoint.
      # @return [String]
      def endpoint
        ENDPOINT
      end

      def connection_options
        CONNECTION_OPTIONS
      end

      # @note Faraday's middleware stack implementation is comparable to that of Rack middleware.  The order of middleware is important: the first middleware on the list wraps all others, while the last middleware is the innermost one.
      # @see https://github.com/technoweenie/faraday#advanced-middleware-usage
      # @see http://mislav.uniqpath.com/2011/07/faraday-advanced-http/
      # @return [Faraday::RackBuilder]
      def middleware
        MIDDLEWARE
      end

    end
  end
end
