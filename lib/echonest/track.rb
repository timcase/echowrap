require 'echonest/identity'

module Echonest
    class Track < Echonest::Identity
      attr_reader :attributes, :status, :artist, :title, :analyzer_version, :release, 
      :audio_md5, :bitrate, :id, :samplerate, :md5
    end
end
