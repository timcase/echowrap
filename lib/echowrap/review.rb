require 'echowrap/base'

module Echowrap
  class Review < Echowrap::Base
    attr_reader :date_found, :date_posted, :id, :image_url, :name, :release, :summary, :url
  end
end

