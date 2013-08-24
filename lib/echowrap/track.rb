require 'echowrap/base'

module Echowrap
    class Track < Echowrap::Base
      attr_reader :analysis_channels, :analysis_sample_rate, :analyzer_version, :artist,
                  :attributes, :audio_md5, :bitrate, :catalog, :code_version, :codestring,
                  :decoder, :duration, :echoprint_version, :echoprintstring, :end_of_fade_in,
                  :foreign_id, :foreign_release_id, :id, :key, :key_confidence, :loudness,
                  :md5, :mode, :mode_confidence, :num_samples, :offset_seconds, :preview_url,
                  :release, :release_image, :sample_md5, :samplerate, :song_id,
                  :start_of_fade_out, :status, :synch_version, :synchstring, :tempo,
                  :tempo_confidence, :time_signature, :time_signature_confidence, :title,
                  :window_seconds

      # @return [Echowrap::AudioSummary]
      def audio_summary
        @audio_summary ||= Echowrap::AudioSummary.new(@attrs[:audio_summary])
      end

    end
end
