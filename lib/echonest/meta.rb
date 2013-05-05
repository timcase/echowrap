require 'echonest/identity'

module Echonest
    class Meta < Echonest::Identity
      attr_reader :analyzer_version, :detailed_status, :filename, :artist,
                  :album, :title, :genre, :bitrate, :sample_rate, :seconds,
                  :status_code, :timestamp, :analysis_time
    end
end
