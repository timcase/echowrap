require 'echonest/identity'

module Echonest
    class Video < Echonest::Identity
      attr_reader :date_found, :image_url, :site, :title, :url
    end
end
