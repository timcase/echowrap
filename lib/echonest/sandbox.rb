require 'echonest/identity'

module Echonest
    class Sandbox < Echonest::Identity
      attr_reader :start, :total
      
      def assets
        @assets ||= map_collection(Echonest::Asset, :assets)
      end

      def id
        'sandbox'
      end
    end
end
