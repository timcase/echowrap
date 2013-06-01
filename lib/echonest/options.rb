require 'echonest/base'

module Echonest
  class Options < Echonest::Base
    attr_reader :adventurousness, :append_scores, :artist_pick, :buckets, 
                :distribution, :dmca, :limit, :playlist_type, :rank_type, 
                :song_types, :sort, :variety

  end
end
