require 'echowrap/base'

module Echowrap
    class Sandbox < Echowrap::Base
      attr_reader :start, :total

      def assets
        @assets ||= map_collection(Echowrap::Asset, :assets)
      end
    end
end
