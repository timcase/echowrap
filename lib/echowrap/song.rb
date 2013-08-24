require 'echowrap/base'

module Echowrap
    class Song < Echowrap::Base
      attr_reader :artist_id, :artist_familiarity, :artist_hotttnesss, :artist_name,
                  :attributes, :id, :message, :score, :song_currency, :song_discovery,
                  :song_hotttnesss, :song_type, :title

      # @return [Echowrap::AudioSummary]
      def audio_summary
        @audio_summary ||= Echowrap::AudioSummary.new(@attrs[:audio_summary])
      end

      # @return [Echowrap::ArtistLocation]
      def artist_location
        @artist_location ||= Echowrap::Location.new(@attrs[:artist_location])
      end

      # @return [Array]
      def tracks
        @tracks ||= map_collection(Echowrap::Track, :tracks)
      end
    end
end
