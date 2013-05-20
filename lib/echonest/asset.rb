require 'echonest/identity'

module Echonest
    class Asset < Echonest::Identity
      attr_reader :explicit, :filename, :release, :title, :type, :year
      
      def echonest_ids
        @echonest_ids ||= map_collection(Echonest::EchonestId, :echonest_ids)
      end
      
      
    end
end
