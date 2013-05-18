require 'echonest/identity'

module Echonest
    class Rule < Echonest::Identity
      attr_reader :rule
      
      def id
        self.rule
      end
    end
end
