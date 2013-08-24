require 'echowrap/base'

module Echowrap
  class AudioSummary < Echowrap::Base
    attr_reader :acousticness, :analysis_url, :audio_md5, :danceability, :duration, :energy,
                :key, :liveness, :loudness, :mode, :speechiness, :liveness, :tempo, :time_signature,
                :valence

  end
end





