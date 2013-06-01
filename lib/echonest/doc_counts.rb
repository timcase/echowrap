require 'echonest/base'

module Echonest
  class DocCounts < Echonest::Base
    attr_reader :audio, :biographies, :blogs, :images, :news, :reviews, :songs, :video

  end
end
