require 'echonest/identity'

module Echonest
    class Genre < Echonest::Identity
      attr_reader :name
      
      def id
        self.name
      end
    end
end
