require 'echonest/base'

module Echonest
  class Review < Echonest::Base
    attr_reader :date_found, :date_posted, :image_url, :name, :release, :summary, :url
  end
end

