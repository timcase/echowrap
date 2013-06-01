require 'echonest/base'

module Echonest
    class Video < Echonest::Base
      attr_reader :date_found, :image_url, :site, :title, :url
    end
end
