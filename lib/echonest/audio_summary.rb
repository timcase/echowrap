require 'echonest/base'

module Echonest
  class AudioSummary < Echonest::Base
    attr_reader :acousticness, :analysis_url, :audio_md5, :danceability, :duration, :energy,
                :key, :liveness, :loudness, :mode, :speechiness, :liveness, :tempo, :time_signature,
                :valence

  end
end





