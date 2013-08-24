require 'echowrap/base'

module Echowrap
    class Seeds < Echowrap::Base
      attr_reader :artist_ids, :descriptions, :genres, :seed_catalogs, :session_catalogs, 
                  :song_ids, :station_catalogs, :track_ids

    end
end
