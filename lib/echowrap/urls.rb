require 'echowrap/base'

module Echowrap
  class Urls < Echowrap::Base
    attr_reader :amazon_url, :itunes_url, :lastfm_url, :mb_url, :myspace_url, 
                :official_url, :wikipedia_url
    
  end
end
