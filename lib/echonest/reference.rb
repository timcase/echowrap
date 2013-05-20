require 'echonest/identity'

module Echonest
    class Reference < Echonest::Identity
      attr_reader :artist_id, :artist_name
      
      def id
        self.artist_id
      end
    end
end

