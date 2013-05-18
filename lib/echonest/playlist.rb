require 'echonest/identity'

module Echonest
    class Playlist < Echonest::Identity
      attr_reader :session_id
      
      # @return [Array]
      def songs
        @songs ||= map_collection(Echonest::Song, :songs)
      end
      
      # @return [Array]
      def lookahead
        @lookahead ||= map_collection(Echonest::Song, :lookahead)
      end
      
      def id
        self.session_id || 'playlist'
      end
    end
end
