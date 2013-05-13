require 'echonest/identity'

module Echonest
    class Song < Echonest::Identity
      attr_reader :artist_id, :artist_familiarity, :artist_hotttnesss, :artist_name, 
                  :attributes, :message, :score, :song_currency, :song_discovery, 
                  :song_hotttnesss, :song_type, :title

      # @return [Echonest::AudioSummary]
      def audio_summary
        @audio_summary ||= Echonest::AudioSummary.new(@attrs[:audio_summary])
      end

      # @return [Echonest::ArtistLocation]
      def artist_location
        @artist_location ||= Echonest::Location.new(@attrs[:artist_location])
      end

      # @return [Echonest::ArtistLocation]
      def tracks
        @tracks ||= map_collection(Echonest::Track, :tracks)
      end
    end
end
