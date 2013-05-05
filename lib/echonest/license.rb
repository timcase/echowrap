require 'echonest/identity'

module Echonest
    class License < Echonest::Identity
      attr_reader :attribution, :type, :url

      #In lieu of having an ID, use the attribution
      def id
        self.attribution
      end
    end
end


