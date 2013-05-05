require 'echonest/analysis'
require 'echonest/audio_summary'
require 'echonest/client'
require 'echonest/configurable'
require 'echonest/error'
require 'echonest/rate_limit'
require 'echonest/sequenced_data'
require 'echonest/sequenced_data/bar'
require 'echonest/sequenced_data/beat'
require 'echonest/sequenced_data/section'
require 'echonest/sequenced_data/segment'
require 'echonest/sequenced_data/tatum'
require 'echonest/song'
require 'echonest/track'
require "echonest/version"

module Echonest
  class << self
    include Echonest::Configurable

    # Delegate to a Echonest::Client
    #
    # @return [Echonest::Client]
    def client
      @client = Echonest::Client.new(options) unless defined?(@client) && @client.hash == options.hash
      @client
    end

    def respond_to_missing?(method_name, include_private=false); client.respond_to?(method_name, include_private); end if RUBY_VERSION >= "1.9"
    def respond_to?(method_name, include_private=false); client.respond_to?(method_name, include_private) || super; end if RUBY_VERSION < "1.9"

    private

      def method_missing(method_name, *args, &block)
        return super unless client.respond_to?(method_name)
        client.send(method_name, *args, &block)
      end
  end
end

Echonest.setup
