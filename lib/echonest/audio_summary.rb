require 'echonest/identity'

module Echonest
    class AudioSummary < Echonest::Identity
      attr_reader :acousticness, :analysis_url, :audio_md5, :danceability, :duration, :energy, 
                  :key, :liveness, :loudness, :mode, :speechiness, :liveness, :tempo, :time_signature, 
                  :valence

      #In lieu of having an ID, use the analysis_url
      def id
        self.analysis_url
      end
    end
end





