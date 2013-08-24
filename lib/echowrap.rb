require 'echowrap/analysis'
require 'echowrap/artist'
require 'echowrap/asset'
require 'echowrap/biography'
require 'echowrap/blog'
require 'echowrap/audio_summary'
require 'echowrap/call_list'
require 'echowrap/category_map'
require 'echowrap/client'
require 'echowrap/configurable'
require 'echowrap/doc_counts'
require 'echowrap/echonest_id'
require 'echowrap/error'
require 'echowrap/familiarity'
require 'echowrap/feed'
require 'echowrap/foreign_id'
require 'echowrap/hotttnesss'
require 'echowrap/genre'
require 'echowrap/keyvalues'
require 'echowrap/image'
require 'echowrap/item'
require 'echowrap/item_request'
require 'echowrap/location'
require 'echowrap/license'
require 'echowrap/meta'
require 'echowrap/news_article'
require 'echowrap/options'
require 'echowrap/playlist'
require 'echowrap/prediction'
require 'echowrap/rate_limit'
require 'echowrap/reference'
require 'echowrap/review'
require 'echowrap/rule'
require 'echowrap/seeds'
require 'echowrap/sequenced_data'
require 'echowrap/sequenced_data/bar'
require 'echowrap/sequenced_data/beat'
require 'echowrap/sequenced_data/section'
require 'echowrap/sequenced_data/segment'
require 'echowrap/sequenced_data/tatum'
require 'echowrap/sandbox'
require 'echowrap/song'
require 'echowrap/status'
require 'echowrap/taste_profile'
require 'echowrap/term'
require 'echowrap/track'
require 'echowrap/update_info'
require 'echowrap/urls'
require 'echowrap/version'
require 'echowrap/video'
require 'echowrap/years_active'


module Echowrap
  class << self
    include Echowrap::Configurable

    # Delegate to a Echowrap::Client
    #
    # @return [Echowrap::Client]
    def client
      @client = Echowrap::Client.new(options) unless defined?(@client) && @client.hash == options.hash
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

Echowrap.setup
