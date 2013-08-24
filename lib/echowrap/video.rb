require 'echowrap/base'

module Echowrap
    class Video < Echowrap::Base
      attr_reader :date_found, :id, :image_url, :site, :title, :url
    end
end
