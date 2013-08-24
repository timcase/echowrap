require 'echowrap/base'

module Echowrap
  class Playlist < Echowrap::Base
    attr_reader :actual_history_length, :api_key, :banned_artist_ids, :banned_song_ids, 
                :contraints, :favorited_artist_ids, :favorited_song_ids, :favorites_map, 
                :history, :invalid_artist_ids, :invalid_songs, :playlist_score, :ratings_map, 
                :restart_request_ids, :rules_retries, :rules_run, :rules_runtime, :session_id, 
                :skipped_songs, :song_scores


    # @return [Array]
    def call_list
      @call_list ||= map_collection(Echowrap::CallList, :call_list)
    end

    # @return [Echowrap::CategoryMap]
    def category_map
      @category_map ||= Echowrap::CategoryMap.new(@attrs[:category_map])
    end

    # @return [Array]
    def lookahead
      @lookahead ||= map_collection(Echowrap::Song, :lookahead)
    end

    # @return [Echowrap::Options]
    def options
      @options ||= Echowrap::Options.new(@attrs[:options])
    end
    
    # @return [Array]
    def rules
      @rules ||= map_collection(Echowrap::Rule, :rules)
    end

    # @return [Echowrap::Seeds]
    def seeds
      @seeds ||= Echowrap::Seeds.new(@attrs[:seeds])
    end
    
    # @return [Array]
    def songs
      @songs ||= map_collection(Echowrap::Song, :songs)
    end     
  end
end
