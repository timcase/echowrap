require 'echonest/identity'

module Echonest
    class ItemRequest < Echonest::Identity
      attr_reader :artist_name, :item_id, :song_name
      
      def id
        self.item_id
      end
    end
end
