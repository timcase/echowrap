require 'uri'
require 'echonest/identity'

module Echonest
    class Track < Echonest::Identity
      attr_reader :analyzer_version, :artist, :attributes, :audio_md5, :bitrate,
                  :catalog, :foreign_id, :foreign_release_id, :id, :md5, :preview_url,
                  :release, :release_image, :samplerate, :song_id, :status, :title

      # @return [Echonest::AudioSummary]
      def audio_summary
        @audio_summary ||= Echonest::AudioSummary.new(@attrs[:audio_summary])
      end

    end
end
