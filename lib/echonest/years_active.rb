require 'echonest/identity'

module Echonest
    class YearsActive < Echonest::Identity
      attr_reader :start
      
      def id
        self.start
      end
    end
end
