require 'echonest/identity'

module Echonest
    class AudioSummary < Echonest::Identity
      attr_reader :analysis_url, :danceability, :duration, :key, :loudness, :mode,
                  :speechiness, :liveness, :tempo, :time_signature

      #In lieu of having an ID, use the analysis_url
      def id
        self.analysis_url
      end
    end
end

