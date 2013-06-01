require 'echonest/base'

module Echonest
    class Sandbox < Echonest::Base
      attr_reader :start, :total

      def assets
        @assets ||= map_collection(Echonest::Asset, :assets)
      end
    end
end
