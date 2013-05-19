require 'echonest/identity'

module Echonest
    class Keyvalues < Echonest::Identity
      attr_reader :cat_type, :is_active, :timestamp, :version
      
      def id
        'keyvalues'
      end
    end
end
