require 'echonest/base'

module Echonest
    class Video < Echonest::Base
      attr_reader :date_found, :id, :image_url, :site, :title, :url
    end
end
