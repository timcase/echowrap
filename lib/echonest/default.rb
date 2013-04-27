# require 'faraday'
# require 'faraday/request/multipart'
require 'echonest/configurable'
# require 'twitter/error/client_error'
# require 'twitter/error/server_error'
# require 'twitter/request/multipart_with_file'
# require 'twitter/response/parse_json'
# require 'twitter/response/raise_error'
 require 'echonest/version'

module Echonest
  module Default
    ENDPOINT = 'http://developer.echonest.com/api' unless defined? Echonest::Default::ENDPOINT
    CONNECTION_OPTIONS = {
      :headers => {
        :accept => 'application/json',
        :user_agent => "Echonest Ruby Gem #{Echonest::Version}",
      },
      :request => {
        :open_timeout => 5,
        :timeout => 10,
      },
      :ssl => {
        :verify => false
      },
    } unless defined? Twitter::Default::CONNECTION_OPTIONS
    # IDENTITY_MAP = false unless defined? Twitter::Default::IDENTITY_MAP
    # MIDDLEWARE = Faraday::Builder.new do |builder|
    #   # Convert file uploads to Faraday::UploadIO objects
    #   builder.use Twitter::Request::MultipartWithFile
    #   # Checks for files in the payload
    #   builder.use Faraday::Request::Multipart
    #   # Convert request params to "www-form-urlencoded"
    #   builder.use Faraday::Request::UrlEncoded
    #   # Handle 4xx server responses
    #   builder.use Twitter::Response::RaiseError, Twitter::Error::ClientError
    #   # Parse JSON response bodies using MultiJson
    #   builder.use Twitter::Response::ParseJson
    #   # Handle 5xx server responses
    #   builder.use Twitter::Response::RaiseError, Twitter::Error::ServerError
    #   # Set Faraday's HTTP adapter
    #   builder.adapter Faraday.default_adapter
    # end unless defined? Twitter::Default::MIDDLEWARE

    class << self

      # @return [Hash]
      def options
        Hash[Echonest::Configurable.keys.map{|key| [key, send(key)]}]
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

      # @note This is configurable in case you want to use a Echonest-compatible endpoint.
      # @return [String]
      def endpoint
        ENDPOINT
      end

      def connection_options
        CONNECTION_OPTIONS
      end

      # def identity_map
      #   IDENTITY_MAP
      # end

      # @note Faraday's middleware stack implementation is comparable to that of Rack middleware.  The order of middleware is important: the first middleware on the list wraps all others, while the last middleware is the innermost one.
      # @see https://github.com/technoweenie/faraday#advanced-middleware-usage
      # @see http://mislav.uniqpath.com/2011/07/faraday-advanced-http/
      # @return [Faraday::Builder]
      # def middleware
      #   MIDDLEWARE
      # end

    end
  end
end
