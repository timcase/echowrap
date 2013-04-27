require 'echonest/client'
require 'echonest/configurable'
require 'echonest/error'
require 'echonest/rate_limit'
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

  end
end
