require 'echonest/identity'

module Echonest
    class CallList < Echonest::Identity
      attr_reader :action, :time
      
      def id
        self.time
      end
    end
end
