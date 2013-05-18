require 'echonest/identity'

module Echonest
  class Playlist < Echonest::Identity
    attr_reader :actual_history_length, :api_key, :banned_artist_ids, :banned_song_ids, 
                :contraints, :favorited_artist_ids, :favorited_song_ids, :favorites_map, 
                :history, :invalid_artist_ids, :invalid_songs, :playlist_score, :ratings_map, 
                :restart_request_ids, :rules_retries, :rules_run, :rules_runtime, :session_id, 
                :skipped_songs, :song_scores


    # @return [Array]
    def call_list
      @call_list ||= map_collection(Echonest::CallList, :call_list)
    end

    # @return [Echonest::CategoryMap]
    def category_map
      @category_map ||= Echonest::CategoryMap.new(@attrs[:category_map])
    end
    
    # @return [String]
    def id
      @attrs[:id] || self.session_id || 'playlist'
    end
    
    # @return [Array]
    def lookahead
      @lookahead ||= map_collection(Echonest::Song, :lookahead)
    end

    # @return [Echonest::Options]
    def options
      @options ||= Echonest::Options.new(@attrs[:options])
    end
    
    # @return [Array]
    def rules
      @rules ||= map_collection(Echonest::Rule, :rules)
    end

    # @return [Echonest::Seeds]
    def seeds
      @seeds ||= Echonest::Seeds.new(@attrs[:seeds])
    end
    
    # @return [Array]
    def songs
      @songs ||= map_collection(Echonest::Song, :songs)
    end     
  end
end
