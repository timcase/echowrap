require 'echonest/identity'

module Echonest
    class Playlist < Echonest::Identity
      attr_reader :session_id
      
      def id
        self.session_id
      end
    end
end
