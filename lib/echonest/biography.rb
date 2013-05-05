require 'echonest/identity'

module Echonest
    class Biography < Echonest::Identity
      attr_reader :site, :text, :url

      # @return [Echonest::License]
      def license
        @license ||= Echonest::License.new(@attrs[:license])
      end

      # @return [String]
      def id
        self.url
      end
    end
end

