require 'echonest/base'

module Echonest
    class Seeds < Echonest::Base
      attr_reader :artist_ids, :descriptions, :genres, :seed_catalogs, :session_catalogs, 
                  :song_ids, :station_catalogs, :track_ids

    end
end
