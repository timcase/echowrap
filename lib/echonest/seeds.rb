require 'echonest/identity'

module Echonest
    class Seeds < Echonest::Identity
      attr_reader :artist_ids, :descriptions, :genres, :seed_catalogs, :session_catalogs, 
                  :song_ids, :station_catalogs, :track_ids
      
      def id
        'seeds'
      end
    end
end
