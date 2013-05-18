require 'faraday'
require 'multi_json'
require 'echonest/configurable'
require 'echonest/api/artist'
require 'echonest/api/song'
require 'echonest/api/track'
require 'echonest/api/playlist'

module Echonest
  class Client
    include Echonest::API::Artist
    include Echonest::API::Song
    include Echonest::API::Track
    include Echonest::API::Playlist
    include Echonest::Configurable
    # Initializes a new Client object
    #
    # @param options [Hash]
    # @return [Echonest::Client]
    def initialize(options={})
      Echonest::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Echonest.instance_variable_get(:"@#{key}"))
      end
    end

    # Perform an HTTP GET request
    def get(path, params={})
      params = params.merge(:api_key => @api_key)
      request(:get, path, params)
    end

    # Perform an HTTP POST request
    def post(path, params={})
      params = params.merge(:api_key => @api_key)
      signature_params = params.values.any?{|value| value.respond_to?(:to_io)} ? {} : params
      request(:post, path, params, signature_params)
    end

    private

      def request(method, path, params={}, signature_params=params)
        connection.send(method.to_sym, path, params).env
      rescue Faraday::Error::ClientError
        raise Echonest::Error::ClientError
      rescue MultiJson::DecodeError
        raise Echonest::Error::DecodeError
      end

      # Returns a Faraday::Connection object
      #
      # @return [Faraday::Connection]
      def connection
        @connection ||= begin
          connection_options = {:builder => @middleware}
          connection_options[:ssl] = {:verify => true} if @endpoint[0..4] == 'https'
          Faraday.new(@endpoint, @connection_options.merge(connection_options))
        end
      end


  end
end
