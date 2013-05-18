require 'echonest/identity'

module Echonest
    class Options < Echonest::Identity
      attr_reader :adventurousness, :append_scores, :artist_pick, :buckets, 
                  :distribution, :dmca, :limit, :playlist_type, :rank_type, 
                  :song_types, :sort, :variety

      def id
        'options'
      end
    end
end
