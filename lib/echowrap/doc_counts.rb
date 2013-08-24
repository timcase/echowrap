require 'echowrap/base'

module Echowrap
  class DocCounts < Echowrap::Base
    attr_reader :audio, :biographies, :blogs, :images, :news, :reviews, :songs, :video

  end
end
