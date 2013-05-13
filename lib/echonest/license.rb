require 'echonest/identity'

module Echonest
    class License < Echonest::Identity
      attr_reader :attribution, :type, :url

      def id
        self.attribution
      end
    end
end


